import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/domain/models/AuthResponse.dart';

@lazySingleton
class AuthStorage {
  final FlutterSecureStorage _storage;
  static const String _sessionId = 'sessionId';

  AuthStorage(this._storage);

  Future<void> saveSessionId(AuthResponse authResponse) async {
    await _storage.write(key: _sessionId, value: authResponse.sessionId);
  }

  Future<String?> getSessionId() async => await _storage.read(key: _sessionId);
}
