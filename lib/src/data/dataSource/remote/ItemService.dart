import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wialon_app/config/env/env.dart';
import 'package:wialon_app/src/data/api/ApiClientDio.dart';
import 'package:wialon_app/src/data/dataSource/local/AuthStorage.dart';
import 'package:wialon_app/src/data/dataSource/local/SharedPrefCache.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

@lazySingleton
class ItemService {
  final ApiClientDio _apiClientDio;
  final AuthStorage _authStorage;
  final SharedPrefCache _sharedPrefCache;
  ItemService(this._apiClientDio, this._authStorage, this._sharedPrefCache);

  Future<Resource<Item>> searchItem() async {
    try {
      final sessionId = await _authStorage.getSessionId();
      final response = await _apiClientDio.dio.post(
        '',
        queryParameters: {
          'svc': 'core/search_item',
          'params': jsonEncode({"id": Env.itemId, "flags": 8193}),
          'sid': sessionId ?? '',
        },
      );
      Item item = Item.fromJson(response.data);

      final newKm = item.counter.mileageCounter;
      final lastKm = _sharedPrefCache.getLastKm();
      if (lastKm != null) {
        final difference = newKm - lastKm;
        item.mileageTrend.difference = difference;
        item.mileageTrend.trend = newKm > lastKm
            ? MileageTrendEnum.up
            : MileageTrendEnum.same;
      }
      
      await _sharedPrefCache.setLastKm(newKm);
      return Success(item);
    } on DioException catch (e) {
      return Error(e.message ?? 'Ocurrió un error al consultar los datos');
    } catch (e) {
      return Error("Ocurrió un error al consultar el kilometraje");
    }
  }
}
