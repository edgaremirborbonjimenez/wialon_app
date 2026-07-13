// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wialon_app/src/data/api/ApiClientDio.dart' as _i527;
import 'package:wialon_app/src/data/dataSource/local/AuthStorage.dart' as _i982;
import 'package:wialon_app/src/data/dataSource/remote/AuthService.dart'
    as _i292;
import 'package:wialon_app/src/data/dataSource/remote/ItemService.dart'
    as _i492;
import 'package:wialon_app/src/data/repository/ItemRepositoryImpl.dart'
    as _i690;
import 'package:wialon_app/src/di/AppModule.dart' as _i862;
import 'package:wialon_app/src/domain/repository/ItemRepository.dart' as _i407;
import 'package:wialon_app/src/domain/useCase/item/ItemUseCases.dart' as _i511;
import 'package:wialon_app/src/domain/useCase/item/SearchItemUseCase.dart'
    as _i22;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i982.AuthStorage>(
      () => _i982.AuthStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i527.ApiClientDio>(
      () => _i527.ApiClientDio(gh<_i982.AuthStorage>()),
    );
    gh.lazySingleton<_i292.AuthService>(
      () => _i292.AuthService(gh<_i527.ApiClientDio>()),
    );
    gh.lazySingleton<_i492.ItemService>(
      () =>
          _i492.ItemService(gh<_i527.ApiClientDio>(), gh<_i982.AuthStorage>()),
    );
    gh.lazySingleton<_i407.ItemRepository>(
      () => _i690.ItemRepositoryImpl(gh<_i492.ItemService>()),
    );
    gh.lazySingleton<_i22.SearchItemUseCase>(
      () => _i22.SearchItemUseCase(gh<_i407.ItemRepository>()),
    );
    gh.lazySingleton<_i511.ItemUseCases>(
      () => _i511.ItemUseCases(searchItemUseCase: gh<_i22.SearchItemUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i862.AppModule {}
