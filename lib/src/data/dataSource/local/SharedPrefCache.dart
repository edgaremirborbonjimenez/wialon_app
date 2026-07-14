import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wialon_app/src/di/utils/SharedPreferencesKeys.dart';

@lazySingleton
class SharedPrefCache {
  final SharedPreferencesWithCache _sharedPrefCache;
  SharedPrefCache(this._sharedPrefCache);

  int? getLastKm() => _sharedPrefCache.getInt(SharedPreferencesKeys.lastKm);

  Future<void> setLastKm(int value) =>
      _sharedPrefCache.setInt(SharedPreferencesKeys.lastKm, value);
}
