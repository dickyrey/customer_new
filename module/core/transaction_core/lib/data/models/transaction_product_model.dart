import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/domain/entities/transaction_product.dart';

class TransactionProductModel extends Equatable {
  const TransactionProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.amount,
    required this.total,
  });

  factory TransactionProductModel.fromJson(Map<String, dynamic> json) =>
      TransactionProductModel(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        amount: json['amount'] as int,
        total: json['total'] as int,
      );

  TransactionProduct toEntity() {
    return TransactionProduct(
      id: id,
      name: name,
      image: image,
      amount: amount,
      total: total,
    );
  }

  final int id;
  final String name;
  final String image;
  final int amount;
  final int total;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        amount,
        total,
      ];
}
