class Counter {
  int calculationFlag;
  int mileageCounter;
  int engineHoursCounter;
  int gprsTrafficCounter;

  Counter({
    this.calculationFlag = 0,
    this.mileageCounter = 0,
    this.engineHoursCounter = 0,
    this.gprsTrafficCounter = 0,
  });

  factory Counter.fromJson(Map<String, dynamic> json) => Counter(
    calculationFlag: json['cfl'],
    mileageCounter: json['cnm'],
    engineHoursCounter: json['cneh'],
    gprsTrafficCounter: json['cnkb'],
  );
}
