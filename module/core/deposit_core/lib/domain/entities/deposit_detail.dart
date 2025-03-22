import 'package:shared_libraries/equatable/equatable.dart';

class DepositDetail extends Equatable {
  const DepositDetail({
    required this.id,
    required this.paymentId,
    required this.amount,
    required this.uniqueCode,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.payment,
  });

  final int id;
  final int paymentId;
  final int amount;
  final int uniqueCode;
  final int total;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DepositDetailPayment payment;

  @override
  List<Object?> get props => [
        id,
        paymentId,
        amount,
        uniqueCode,
        total,
        status,
        createdAt,
        updatedAt,
        payment,
      ];
}

class DepositDetailPayment extends Equatable {
  const DepositDetailPayment({
    required this.id,
    required this.name,
    required this.bankAccount,
    required this.description,
    required this.image,
    required this.type,
  });

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
