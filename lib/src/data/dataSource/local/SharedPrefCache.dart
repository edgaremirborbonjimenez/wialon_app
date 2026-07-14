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

  String? getNameUnit() =>
      _sharedPrefCache.getString(SharedPreferencesKeys.nameUnit);

  Future<void> setNameUnit(String value) =>
      _sharedPrefCache.setString(SharedPreferencesKeys.nameUnit, value);

  String? getLastTrend() =>
      _sharedPrefCache.getString(SharedPreferencesKeys.lastTrend);

  Future<void> setLastTrend(String value) =>
      _sharedPrefCache.setString(SharedPreferencesKeys.lastTrend, value);

  int? getLastDifference() =>
      _sharedPrefCache.getInt(SharedPreferencesKeys.lastDifference);

  Future<void> setLastDifference(int value) =>
      _sharedPrefCache.setInt(SharedPreferencesKeys.lastDifference, value);
}
