import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/data/models/transaction_product_model.dart';
import 'package:transaction_core/domain/entities/transaction.dart';

class TransactionModel extends Equatable {
  const TransactionModel({
    required this.id,
    required this.total,
    required this.status,
    required this.isReviewed,
    required this.productList,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final isReviewed = json['is_reviewed'] == '0';

    return TransactionModel(
      id: json['id'] as int,
      total: json['total'] as int,
      status: json['status'] as String,
      isReviewed: isReviewed,
      productList: List<TransactionProductModel>.from(
        (json['products'] as Iterable<dynamic>).map(
          (e) => TransactionProductModel.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: id,
      total: total,
      status: status,
      isReviewed: isReviewed,
      productList: productList.map((e) => e.toEntity()).toList(),
    );
  }

  final int id;
  final int total;
  final String status;
  final bool isReviewed;
  final List<TransactionProductModel> productList;

  @override
  List<Object?> get props => [
        id,
        total,
        status,
        isReviewed,
      ];
}
