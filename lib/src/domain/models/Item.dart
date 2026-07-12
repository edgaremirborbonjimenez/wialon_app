import 'package:wialon_app/src/domain/models/Counter.dart';
import 'package:wialon_app/src/domain/models/GeneralProperty.dart';

class Item {
  GeneralProperty generalProperty;
  Counter counter;

  Item({required this.generalProperty, required this.counter});

  factory Item.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    return Item(
      generalProperty: GeneralProperty.fromJson(item),
      counter: Counter.fromJson(item),
    );
  }
}
