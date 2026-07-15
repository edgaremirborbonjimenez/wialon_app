import 'package:equatable/equatable.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';

class ItemState extends Equatable {
  final Resource? response;
  final bool isInit;

  const ItemState({this.response, this.isInit = false});

  ItemState copyWith({Resource? response, bool? isInit}) {
    return ItemState(response: response, isInit: isInit ?? false);
  }

  @override
  List<Object?> get props => [response, isInit];
}
