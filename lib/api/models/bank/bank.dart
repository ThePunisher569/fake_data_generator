import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class Bank {
  final int id;
  final String uid, accountNumber, iban, bankName, routingNumber, swiftBic;

  Bank(this.id, this.uid, this.accountNumber, this.iban, this.bankName,
      this.routingNumber, this.swiftBic);

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  @override
  String toString() {
    return 'Bank{id: $id, uid: $uid, accountNumber: $accountNumber, iban: $iban, bankName: $bankName, routingNumber: $routingNumber, swiftBic: $swiftBic}';
  }
}
