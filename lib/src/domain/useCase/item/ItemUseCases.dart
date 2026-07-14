import 'package:injectable/injectable.dart';
import 'package:wialon_app/src/domain/useCase/item/GetLastItemResultUseCase.dart';
import 'package:wialon_app/src/domain/useCase/item/SearchItemUseCase.dart';

@lazySingleton
class ItemUseCases {
  SearchItemUseCase searchItemUseCase;
  GetLastItemResultUseCase getLastItemResultUseCase;
  ItemUseCases({
    required this.searchItemUseCase,
    required this.getLastItemResultUseCase,
  });
}
