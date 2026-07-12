import 'package:wialon_app/src/domain/models/AuthResponse.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login();
}
