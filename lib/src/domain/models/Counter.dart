class Counter {
  int calculationFlag;
  int mileageCounter;
  int engineHoursCounter;
  int gprsTrafficCounter;

  Counter({
    required this.calculationFlag,
    required this.mileageCounter,
    required this.engineHoursCounter,
    required this.gprsTrafficCounter,
  });

  factory Counter.fromJson(Map<String, dynamic> json) => Counter(
    calculationFlag: json['cfl'],
    mileageCounter: json['cnm'],
    engineHoursCounter: json['cneh'],
    gprsTrafficCounter: json['cnkb'],
  );

  factory Counter.empty() {
    return Counter(
      calculationFlag: 0,
      mileageCounter: 0,
      engineHoursCounter: 0,
      gprsTrafficCounter: 0,
    );
  }
}
