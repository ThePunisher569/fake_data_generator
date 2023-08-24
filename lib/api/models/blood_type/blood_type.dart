import 'package:json_annotation/json_annotation.dart';

part 'blood_type.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class BloodType {
  final int id;
  final String uid, type, rhFactor, group;

  BloodType(this.id, this.uid, this.type, this.rhFactor, this.group);

  factory BloodType.fromJson(Map<String, dynamic> json) =>
      _$BloodTypeFromJson(json);

  @override
  String toString() {
    return 'BloodType{id: $id, uid: $uid, type: $type, rhFactor: $rhFactor, group: $group}';
  }
}
