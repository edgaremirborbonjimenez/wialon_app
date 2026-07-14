import 'package:wialon_app/src/domain/models/Counter.dart';
import 'package:wialon_app/src/domain/models/GeneralProperty.dart';
import 'package:wialon_app/src/domain/models/MileageTrend.dart';

class Item {
  late GeneralProperty generalProperty;
  late Counter counter;
  late MileageTrend mileageTrend;

  Item({
    GeneralProperty? generalProperty,
    Counter? counter,
    MileageTrend? mileageTrend,
  }) {
    this.generalProperty = generalProperty ?? GeneralProperty();
    this.counter = counter ?? Counter();
    this.mileageTrend = mileageTrend ?? MileageTrend();
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    return Item(
      generalProperty: GeneralProperty.fromJson(item),
      counter: Counter.fromJson(item),
      mileageTrend: MileageTrend(),
    );
  }
}
