import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';

class MileageTrend {
  int difference;
  MileageTrendEnum trend;

  MileageTrend({this.trend = MileageTrendEnum.unkown, this.difference = 0});
}
