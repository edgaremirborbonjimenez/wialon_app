import 'package:equatable/equatable.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

class ItemState extends Equatable {
  final Resource? response;

  const ItemState({this.response});

  ItemState copyWith({Resource? response}) {
    return ItemState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
