// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodType _$BloodTypeFromJson(Map<String, dynamic> json) => BloodType(
      json['id'] as int,
      json['uid'] as String,
      json['type'] as String,
      json['rh_factor'] as String,
      json['group'] as String,
    );

Map<String, dynamic> _$BloodTypeToJson(BloodType instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'type': instance.type,
      'rh_factor': instance.rhFactor,
      'group': instance.group,
    };
