// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['id'] as int,
      (json['latitude'] as num).toDouble(),
      json['uid'] as String,
      json['city'] as String,
      json['street_name'] as String,
      json['street_address'] as String,
      json['secondary_address'] as String,
      json['building_number'] as String,
      json['mail_box'] as String,
      json['community'] as String,
      json['zip_code'] as String,
      json['zip'] as String,
      json['postcode'] as String,
      json['time_zone'] as String,
      json['street_suffix'] as String,
      json['city_suffix'] as String,
      json['city_prefix'] as String,
      json['state'] as String,
      json['state_abbr'] as String,
      json['country'] as String,
      json['country_code'] as String,
      json['full_address'] as String,
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'city': instance.city,
      'street_name': instance.streetName,
      'street_address': instance.streetAddress,
      'secondary_address': instance.secondaryAddress,
      'building_number': instance.buildingNumber,
      'mail_box': instance.mailBox,
      'community': instance.community,
      'zip_code': instance.zipCode,
      'zip': instance.zip,
      'postcode': instance.postcode,
      'time_zone': instance.timeZone,
      'street_suffix': instance.streetSuffix,
      'city_suffix': instance.citySuffix,
      'city_prefix': instance.cityPrefix,
      'state': instance.state,
      'state_abbr': instance.stateAbbr,
      'country': instance.country,
      'country_code': instance.countryCode,
      'full_address': instance.fullAddress,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
