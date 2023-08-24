import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class UserAddress {
  final String city, state, country, streetName, streetAddress, zipCode;

  final Coordinates coordinates;

  UserAddress({
    required this.city,
    required this.streetName,
    required this.streetAddress,
    required this.zipCode,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  @override
  String toString() {
    return 'UserAddress{city: $city, streetName: $streetName, streetAddress: $streetAddress, zipCode: $zipCode, state: $state, country: $country, coordinates: $coordinates}';
  }
}

@JsonSerializable(createFactory: true)
class Coordinates {
  final double lat, lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  @override
  String toString() {
    return 'Coordinates{lat: $lat, lng: $lng}';
  }
}
