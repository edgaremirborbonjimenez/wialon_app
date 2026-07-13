class GeneralProperty {
  int measureUnit;
  String name;
  int superClassId;
  int id;
  int currentUserAccessLevel;

  GeneralProperty({
    required this.measureUnit,
    required this.name,
    required this.superClassId,
    required this.id,
    required this.currentUserAccessLevel,
  });

  factory GeneralProperty.fromJson(Map<String, dynamic> json) =>
      GeneralProperty(
        measureUnit: json['mu'],
        name: json['nm'],
        superClassId: json['cls'],
        id: json['id'],
        currentUserAccessLevel: json['uacl'],
      );

  factory GeneralProperty.empty() {
    return GeneralProperty(
      measureUnit: 0,
      name: '---',
      superClassId: 0,
      id: 0,
      currentUserAccessLevel: 0,
    );
  }
}
