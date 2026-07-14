import 'package:wialon_app/src/domain/models/Counter.dart';
import 'package:wialon_app/src/domain/models/GeneralProperty.dart';
import 'package:wialon_app/src/domain/models/MileageTrend.dart';

class Item {
  GeneralProperty generalProperty;
  Counter counter;
  MileageTrend? mileageTrend;

  Item({
    required this.generalProperty,
    required this.counter,
    this.mileageTrend,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    return Item(
      generalProperty: GeneralProperty.fromJson(item),
      counter: Counter.fromJson(item),
      mileageTrend: MileageTrend.empty(),
    );
  }

  factory Item.empty() {
    return Item(
      generalProperty: GeneralProperty.empty(),
      counter: Counter.empty(),
      mileageTrend: MileageTrend.empty(),
    );
  }
}
