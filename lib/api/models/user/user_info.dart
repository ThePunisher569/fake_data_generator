import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

// User Employment
@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class Employment {
  final String title, keySkill;

  Employment(this.title, this.keySkill);

  factory Employment.fromJson(Map<String, dynamic> json) =>
      _$EmploymentFromJson(json);

  @override
  String toString() {
    return 'Employment{title: $title, keySkill: $keySkill}';
  }
}

// User Credit Card
@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class CreditCard {
  final String ccNumber;

  CreditCard(this.ccNumber);

  factory CreditCard.fromJson(Map<String, dynamic> json) =>
      _$CreditCardFromJson(json);

  @override
  String toString() {
    return 'CreditCard{ccNumber: $ccNumber}';
  }
}

// User Subscription
@JsonSerializable(createFactory: true, fieldRename: FieldRename.snake)
class Subscription {
  final String plan, status, term, paymentMethod;

  Subscription(this.plan, this.status, this.term, this.paymentMethod);

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  @override
  String toString() {
    return 'Subscription{plan: $plan, status: $status, term: $term, paymentMethod: $paymentMethod}';
  }
}
