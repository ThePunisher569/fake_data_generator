import 'package:json_annotation/json_annotation.dart';

import 'user_address.dart';
import 'user_info.dart';

part 'user.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class User {
  final int id;
  final String uid, password, username, email, avatar, gender, firstName;
  final String dateOfBirth, socialInsuranceNumber, lastName, phoneNumber;

  final CreditCard creditCard;

  final UserAddress address;

  final Employment employment;

  final Subscription subscription;

  User(
    this.id,
    this.uid,
    this.password,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.avatar,
    this.gender,
    this.phoneNumber,
    this.socialInsuranceNumber,
    this.dateOfBirth,
    this.address,
    this.employment,
    this.creditCard,
    this.subscription,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String toString() {
    return 'User{id: $id, uid: $uid, password: $password, username: $username, email: $email, avatar: $avatar, gender: $gender, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, socialInsuranceNumber: $socialInsuranceNumber, creditCard: $creditCard, address: $address, employment: $employment, subscription: $subscription}';
  }
}
