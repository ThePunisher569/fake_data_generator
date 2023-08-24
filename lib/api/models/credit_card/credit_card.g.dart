// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      json['id'] as int,
      json['uid'] as String,
      json['credit_card_number'] as String,
      json['credit_card_expiry_date'] as String,
      json['credit_card_type'] as String,
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'credit_card_number': instance.creditCardNumber,
      'credit_card_expiry_date': instance.creditCardExpiryDate,
      'credit_card_type': instance.creditCardType,
    };
