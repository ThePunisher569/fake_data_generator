// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appliance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appliance _$ApplianceFromJson(Map<String, dynamic> json) => Appliance(
      json['id'] as int,
      json['uid'] as String,
      json['brand'] as String,
      json['equipment'] as String,
    );

Map<String, dynamic> _$ApplianceToJson(Appliance instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'brand': instance.brand,
      'equipment': instance.equipment,
    };
