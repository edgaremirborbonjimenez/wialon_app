import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/domain/useCase/item/SearchItemUseCase.dart';

@lazySingleton
class ItemUseCases {
  SearchItemUseCase searchItemUseCase;
  ItemUseCases({required this.searchItemUseCase});
}
