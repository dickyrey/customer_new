import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class DepositModel extends Equatable {
  const DepositModel({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) => DepositModel(
        id: json['id'] as int,
        total: json['total'] as int,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Deposit toEntity() {
    return Deposit(
      id: id,
      total: total,
      status: status,
      createdAt: createdAt,
    );
  }

  final int id;
  final int total;
  final String status;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        total,
        status,
        createdAt,
      ];
}
