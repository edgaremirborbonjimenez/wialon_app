class GeneralProperty {
  int measureUnit;
  String name;
  int superClassId;
  int id;
  int currentUserAccessLevel;

  GeneralProperty({
    this.measureUnit = 0,
    this.name = '---',
    this.superClassId = 0,
    this.id = 0,
    this.currentUserAccessLevel = 0,
  });

  factory GeneralProperty.fromJson(Map<String, dynamic> json) =>
      GeneralProperty(
        measureUnit: json['mu'],
        name: json['nm'],
        superClassId: json['cls'],
        id: json['id'],
        currentUserAccessLevel: json['uacl'],
      );
}
