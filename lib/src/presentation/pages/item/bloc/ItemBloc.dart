import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/useCase/item/ItemUseCases.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemEvent.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemState.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemUseCases itemUseCases;

  ItemBloc(this.itemUseCases) : super(ItemState()) {
    on<ItemInitEvent>(_onInitEvent);
    on<SearchItem>(_onSearchItem);
  }
  Future<void> _onInitEvent(
    ItemInitEvent event,
    Emitter<ItemState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource<Item> item = await itemUseCases.getLastItemResultUseCase.run();
    emit(state.copyWith(response: item));
  }

  Future<void> _onSearchItem(SearchItem event, Emitter<ItemState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource<Item> item = await itemUseCases.searchItemUseCase.run();
    emit(state.copyWith(response: item));
  }
}
