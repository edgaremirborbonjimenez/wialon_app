import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wialon_app/env/env.dart';
import 'package:wialon_app/src/data/api/ApiClientDio.dart';
import 'package:wialon_app/src/domain/models/AuthResponse.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

@lazySingleton
class AuthService {
  ApiClientDio apiClientDio;
  AuthService(this.apiClientDio);

  Future<Resource<AuthResponse>> login() async {
    try {
      final response = await apiClientDio.dio.post(
        '',
        queryParameters: {
          'svc': 'token/login',
          'params': {'token': Env.token},
        },
      );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      return Success(authResponse);
    } on DioException catch (e) {
      return Error(e.message ?? 'No se pudo conseguir la sesión.');
    } catch (e) {
      return Error("Ocurrió un error al consultar la sesión.");
    }
  }
}
