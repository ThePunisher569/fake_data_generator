// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      json['id'] as int,
      json['uid'] as String,
      json['account_number'] as String,
      json['iban'] as String,
      json['bank_name'] as String,
      json['routing_number'] as String,
      json['swift_bic'] as String,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'account_number': instance.accountNumber,
      'iban': instance.iban,
      'bank_name': instance.bankName,
      'routing_number': instance.routingNumber,
      'swift_bic': instance.swiftBic,
    };
