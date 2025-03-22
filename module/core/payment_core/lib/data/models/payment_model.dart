import 'package:payment_core/domain/entities/payment.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class PaymentModel extends Equatable {
  const PaymentModel({
    required this.id,
    required this.name,
    required this.bankAccount,
    required this.description,
    required this.image,
    required this.type,
  });
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as int,
      name: json['name'] as String,
      bankAccount: json['bank_account'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
    );
  }

  Payment toEntity() {
    return Payment(
      id: id,
      name: name,
      bankAccount: bankAccount,
      description: description,
      image: image,
      type: type,
    );
  }

  final int id;
  final String name;
  final String bankAccount;
  final String description;
  final String image;
  final String type;

  @override
  List<Object?> get props => [
        id,
        name,
        bankAccount,
        description,
        image,
        type,
      ];
}
