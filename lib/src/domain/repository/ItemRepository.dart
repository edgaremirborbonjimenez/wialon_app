import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

abstract class ItemRepository {
  Future<Resource<Item>> searchItem();
  Future<Resource<Item>> getLastItemResult();
}
