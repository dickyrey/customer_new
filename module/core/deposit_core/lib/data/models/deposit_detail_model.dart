import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class DepositDetailModel extends Equatable {
  const DepositDetailModel({
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

  factory DepositDetailModel.fromJson(Map<String, dynamic> json) =>
      DepositDetailModel(
        id: json['id'] as int,
        paymentId: json['payment_id'] as int,
        amount: json['amount'] as int,
        uniqueCode: json['unique_code'] as int,
        total: json['total'] as int,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        payment: DepositDetailPaymentModel.fromJson(
          json['payment'] as Map<String, dynamic>,
        ),
      );

  DepositDetail toEntity() {
    return DepositDetail(
      id: id,
      paymentId: paymentId,
      amount: amount,
      uniqueCode: uniqueCode,
      total: total,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      payment: payment.toEntity(),
    );
  }

  final int id;
  final int paymentId;
  final int amount;
  final int uniqueCode;
  final int total;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DepositDetailPaymentModel payment;

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

class DepositDetailPaymentModel extends Equatable {
  const DepositDetailPaymentModel({
    required this.id,
    required this.name,
    required this.bankAccount,
    required this.description,
    required this.image,
    required this.type,
  });

  factory DepositDetailPaymentModel.fromJson(Map<String, dynamic> json) =>
      DepositDetailPaymentModel(
        id: json['id'] as int,
        name: json['name'] as String,
        bankAccount: json['bank_account'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        type: json['type'] as String,
      );

  DepositDetailPayment toEntity() {
    return DepositDetailPayment(
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
