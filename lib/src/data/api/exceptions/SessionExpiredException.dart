import 'package:dio/dio.dart';

class SessionExpiredException extends DioException {
  SessionExpiredException({required super.requestOptions, required super.response})
      : super(type: DioExceptionType.unknown, error: 'Sesión expirada');
}