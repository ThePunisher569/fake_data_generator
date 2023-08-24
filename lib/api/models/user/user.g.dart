// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['uid'] as String,
      json['password'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['username'] as String,
      json['email'] as String,
      json['avatar'] as String,
      json['gender'] as String,
      json['phone_number'] as String,
      json['social_insurance_number'] as String,
      json['date_of_birth'] as String,
      UserAddress.fromJson(json['address'] as Map<String, dynamic>),
      Employment.fromJson(json['employment'] as Map<String, dynamic>),
      CreditCard.fromJson(json['credit_card'] as Map<String, dynamic>),
      Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'password': instance.password,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'first_name': instance.firstName,
      'date_of_birth': instance.dateOfBirth,
      'social_insurance_number': instance.socialInsuranceNumber,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'credit_card': instance.creditCard,
      'address': instance.address,
      'employment': instance.employment,
      'subscription': instance.subscription,
    };
