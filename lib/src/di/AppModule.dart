import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wialon_app/src/di/utils/SharedPreferencesKeys.dart';

@module
abstract class AppModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferencesWithCache> get sharedPrefCache =>
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{
            SharedPreferencesKeys.lastKm,
            SharedPreferencesKeys.nameUnit,
            SharedPreferencesKeys.lastTrend,
            SharedPreferencesKeys.lastDifference,
          },
        ),
      );

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
