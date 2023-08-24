import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class Address {
  final int id;
  final String uid, city, streetName, streetAddress, secondaryAddress;
  final String buildingNumber, mailBox, community, zipCode, zip, postcode;
  final String timeZone, streetSuffix, citySuffix, cityPrefix, state, stateAbbr;
  final String country, countryCode, fullAddress;
  final double longitude, latitude;

  Address(
    this.id,
    this.latitude,
    this.uid,
    this.city,
    this.streetName,
    this.streetAddress,
    this.secondaryAddress,
    this.buildingNumber,
    this.mailBox,
    this.community,
    this.zipCode,
    this.zip,
    this.postcode,
    this.timeZone,
    this.streetSuffix,
    this.citySuffix,
    this.cityPrefix,
    this.state,
    this.stateAbbr,
    this.country,
    this.countryCode,
    this.fullAddress,
    this.longitude,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  String toString() {
    return 'Address{id: $id, latitude: $latitude, uid: $uid, city: $city, streetName: $streetName, streetAddress: $streetAddress, secondaryAddress: $secondaryAddress, buildingNumber: $buildingNumber, mailBox: $mailBox, community: $community, zipCode: $zipCode, zip: $zip, postcode: $postcode, timeZone: $timeZone, streetSuffix: $streetSuffix, citySuffix: $citySuffix, cityPrefix: $cityPrefix, state: $state, stateAbbr: $stateAbbr, country: $country, countryCode: $countryCode, fullAddress: $fullAddress, longitude: $longitude}';
  }
}
