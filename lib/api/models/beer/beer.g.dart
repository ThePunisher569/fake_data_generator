// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      json['id'] as int,
      json['uid'] as String,
      json['brand'] as String,
      json['name'] as String,
      json['style'] as String,
      json['hop'] as String,
      json['yeast'] as String,
      json['malts'] as String,
      json['ibu'] as String,
      json['alcohol'] as String,
      json['blg'] as String,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'brand': instance.brand,
      'name': instance.name,
      'style': instance.style,
      'hop': instance.hop,
      'yeast': instance.yeast,
      'malts': instance.malts,
      'ibu': instance.ibu,
      'alcohol': instance.alcohol,
      'blg': instance.blg,
    };
