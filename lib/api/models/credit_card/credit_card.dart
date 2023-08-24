import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class CreditCard {
  final int id;
  final String uid, creditCardNumber, creditCardExpiryDate, creditCardType;

  CreditCard(this.id, this.uid, this.creditCardNumber,
      this.creditCardExpiryDate, this.creditCardType);

  factory CreditCard.fromJson(Map<String, dynamic> json) =>
      _$CreditCardFromJson(json);

  @override
  String toString() {
    return 'CreditCard{id: $id, uid: $uid, creditCardNumber: $creditCardNumber, creditCardExpiryDate: $creditCardExpiryDate, creditCardType: $creditCardType}';
  }
}
