import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/domain/repository/ItemRepository.dart';

@lazySingleton
class GetLastItemResultUseCase{
  final ItemRepository _itemRepository;
  GetLastItemResultUseCase(this._itemRepository);
  run() => _itemRepository.getLastItemResult();
}