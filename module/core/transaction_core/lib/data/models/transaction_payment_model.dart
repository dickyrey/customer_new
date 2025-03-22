import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/domain/entities/transaction_payment.dart';

class TransactionPaymentModel extends Equatable {
  const TransactionPaymentModel({
    required this.id,
    required this.name,
    required this.bankAccount,
    required this.description,
    required this.image,
    required this.type,
  });

  factory TransactionPaymentModel.fromJson(Map<String, dynamic> json) =>
      TransactionPaymentModel(
        id: json['id'] as int,
        name: json['name'] as String,
        bankAccount: json['bank_account'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        type: json['type'] as String,
      );

  TransactionPayment toEntity() {
    return TransactionPayment(
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
