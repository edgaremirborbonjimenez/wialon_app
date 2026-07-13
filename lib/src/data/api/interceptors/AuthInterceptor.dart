import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wialon_app/config/env/env.dart';
import 'package:wialon_app/src/data/api/exceptions/SessionExpiredException.dart';
import 'package:wialon_app/src/data/api/utils/HttpErrorResponse.dart';
import 'package:wialon_app/src/data/dataSource/local/AuthStorage.dart';
import 'package:wialon_app/src/domain/models/AuthResponse.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final AuthStorage authStorage;
  final Dio _refreshDio;
  Completer<bool>? _refreshCompleter;

  AuthInterceptor({
    required this.dio,
    required this.authStorage,
    required String baseUrl,
  }) : _refreshDio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final sessionId = await authStorage.getSessionId();
    if (sessionId != null) {
      options.queryParameters['sid'] = sessionId;
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;
    if (data is Map<String, dynamic> && data['error'] != null) {
      final error = data['error'];
      final customException = _buildDioException(response, error);
      return handler.reject(customException, true);
    }
    return handler.next(response);
  }

  DioException _buildDioException(Response response, dynamic errorCode) {
    DioExceptionType exceptionType = DioExceptionType.badResponse;
    String errorMessage =
        'Hubo un error al solicitar los datos, favor de intentar mas tarde.';

    if (errorCode == HttpErrorResponse.unauthorized.value) {
      return SessionExpiredException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    return DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: exceptionType,
      error: errorMessage,
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err is SessionExpiredException) {
      try {
        final alreadyRetried = err.requestOptions.extra['retried'] == true;

        if (alreadyRetried) {
          return handler.next(err);
        }
        //Arreglar problema de dependencia circular
        bool loginResponse = await _refreshSession();
        if (!loginResponse) {
          return handler.next(err);
        }
        final newSessionId = await authStorage.getSessionId();
        final retryOptions = err.requestOptions;
        retryOptions.queryParameters['sid'] = newSessionId;
        retryOptions.extra['retried'] = true;

        final response = await dio.fetch(retryOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  Future<bool> _refreshSession() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }
    _refreshCompleter = Completer<bool>();
    try {
      final response = await _refreshDio.post(
        '',
        queryParameters: {
          'svc': 'token/login',
          'params': jsonEncode({'token': Env.token}),
        },
      );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      await authStorage.saveSessionId(authResponse);
      _refreshCompleter!.complete(true);
      return true;
    } catch (e) {
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }
}
