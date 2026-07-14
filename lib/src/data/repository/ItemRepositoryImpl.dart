import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/data/dataSource/remote/ItemService.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/repository/ItemRepository.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

@LazySingleton(as: ItemRepository)
class ItemRepositoryImpl extends ItemRepository {
  final ItemService _itemService;

  ItemRepositoryImpl(this._itemService);

  @override
  Future<Resource<Item>> searchItem() {
    return _itemService.searchItem();
  }

  @override
  Future<Resource<Item>> getLastItemResult() {
    return _itemService.getLastItemResult();
  }
}
