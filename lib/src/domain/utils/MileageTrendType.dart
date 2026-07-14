import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';

class MileageTrendType {
  static const String up = 'up';
  static const String same = 'same';
  static const String firstRequest = 'firstRequest';
  static const String start = 'start';

  static String getEnumToString(MileageTrendEnum mileageTrendType) {
    return switch (mileageTrendType) {
      MileageTrendEnum.start => start,
      MileageTrendEnum.firstRequest => firstRequest,
      MileageTrendEnum.same => same,
      MileageTrendEnum.up => up,
    };
  }

  static MileageTrendEnum getStringToEnum(String mileageTrendType) {
    if (mileageTrendType == start) {
      return MileageTrendEnum.start;
    } else if (mileageTrendType == firstRequest) {
      return MileageTrendEnum.firstRequest;
    } else if (mileageTrendType == same) {
      return MileageTrendEnum.same;
    } else if (mileageTrendType == up) {
      return MileageTrendEnum.up;
    } else {
      return MileageTrendEnum.start;
    }
  }
}
