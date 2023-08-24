import 'package:json_annotation/json_annotation.dart';

part 'appliance.g.dart';

@JsonSerializable(createFactory: true)
class Appliance {
  final int id;
  final String uid, brand, equipment;

  Appliance(this.id, this.uid, this.brand, this.equipment);

  factory Appliance.fromJson(Map<String, dynamic> json) =>
      _$ApplianceFromJson(json);

  @override
  String toString() {
    return 'Appliance{id: $id, uid: $uid, brand: $brand, equipment: $equipment}';
  }
}
