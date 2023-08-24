// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employment _$EmploymentFromJson(Map<String, dynamic> json) => Employment(
      json['title'] as String,
      json['key_skill'] as String,
    );

Map<String, dynamic> _$EmploymentToJson(Employment instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key_skill': instance.keySkill,
    };

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      json['cc_number'] as String,
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'cc_number': instance.ccNumber,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      json['plan'] as String,
      json['status'] as String,
      json['term'] as String,
      json['payment_method'] as String,
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'status': instance.status,
      'term': instance.term,
      'payment_method': instance.paymentMethod,
    };
