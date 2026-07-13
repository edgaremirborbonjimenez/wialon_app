import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ItemInitEvent extends ItemEvent {
  const ItemInitEvent();
}

class SearchItem extends ItemEvent {
  const SearchItem();
}
