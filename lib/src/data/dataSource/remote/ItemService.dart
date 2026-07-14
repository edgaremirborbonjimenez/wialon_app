import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wialon_app/config/env/env.dart';
import 'package:wialon_app/src/data/api/ApiClientDio.dart';
import 'package:wialon_app/src/data/dataSource/local/AuthStorage.dart';
import 'package:wialon_app/src/data/dataSource/local/SharedPrefCache.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';
import 'package:wialon_app/src/domain/utils/MileageTrendType.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

@lazySingleton
class ItemService {
  final ApiClientDio _apiClientDio;
  final AuthStorage _authStorage;
  final SharedPrefCache _sharedPrefCache;
  ItemService(this._apiClientDio, this._authStorage, this._sharedPrefCache);

  Future<Resource<Item>> getLastItemResult() async {
    try {
      final item = Item();
      final lastKm = _sharedPrefCache.getLastKm();
      final nameUnit = _sharedPrefCache.getNameUnit();
      final lastTrend = _sharedPrefCache.getLastTrend();
      final lastDifference = _sharedPrefCache.getLastDifference();

      if (lastKm != null) {
        item.counter.mileageCounter = lastKm;
      }
      if (nameUnit != null) {
        item.generalProperty.name = nameUnit;
      }
      if (lastTrend != null) {
        item.mileageTrend.trend = MileageTrendType.getStringToEnum(lastTrend);
      }

      if (lastDifference != null) {
        item.mileageTrend.difference = lastDifference;
      }
      return Success(item);
    } catch (e) {
      return Error(
        'Ocurrió un error al consultar los ultimos datos solicitados',
      );
    }
  }

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
      } else {
        item.mileageTrend.trend = MileageTrendEnum.firstRequest;
      }
      final nameUnit = _sharedPrefCache.getNameUnit();
      if (nameUnit == null) {
        await _sharedPrefCache.setNameUnit(item.generalProperty.name);
      }
      final mileageTrendString = MileageTrendType.getEnumToString(
        item.mileageTrend.trend,
      );
      await _sharedPrefCache.setLastDifference(item.mileageTrend.difference);
      await _sharedPrefCache.setLastTrend(mileageTrendString);
      await _sharedPrefCache.setLastKm(newKm);
      return Success(item);
    } on DioException catch (e) {
      print("DIO ERROR : ${e.message}");
      return Error('No se pudo consultar el kilometraje, favor de intentarlo mas tarde');
    } catch (e) {
      print("GENERAL ERROR : ${e}");
      return Error("Ocurrió un error al consultar el kilometraje");
    }
  }
}
