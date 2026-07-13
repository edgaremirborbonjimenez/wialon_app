import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/domain/repository/ItemRepository.dart';

@lazySingleton
class SearchItemUseCase {
  final ItemRepository _itemRepository;
  SearchItemUseCase(this._itemRepository);
  run() => _itemRepository.searchItem();
}
