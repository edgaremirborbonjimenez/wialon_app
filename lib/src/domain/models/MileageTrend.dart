import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';

class MileageTrend {
  final int? difference;
  final MileageTrendEnum trend;

  MileageTrend({required this.trend, this.difference});

  factory MileageTrend.empty() {
    return MileageTrend(trend: MileageTrendEnum.unkown, difference: 0);
  }
}
