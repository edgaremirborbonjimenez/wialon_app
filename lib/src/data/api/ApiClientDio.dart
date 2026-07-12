import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wialon_app/env/env.dart';
import 'package:wialon_app/src/data/api/interceptors/AuthInterceptor.dart';
import 'package:wialon_app/src/data/dataSource/local/AuthStorage.dart';

@lazySingleton
class ApiClientDio {
  late Dio dio;
  final AuthStorage _authStorage;

  ApiClientDio(this._authStorage) {
    final baseUrl = Env.apiUrl;
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(dio: dio, authStorage: _authStorage, baseUrl: baseUrl),
    );
  }
}
