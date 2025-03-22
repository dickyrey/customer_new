import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/data/models/transaction_payment_model.dart';
import 'package:transaction_core/data/models/transaction_sales_model.dart';
import 'package:transaction_core/domain/entities/transaction_product.dart';

class TransactionDetail extends Equatable {
  const TransactionDetail({
    required this.id,
    required this.address,
    required this.uniqueCode,
    required this.point,
    required this.deposit,
    required this.reward,
    required this.subTotal,
    required this.total,
    required this.status,
    required this.rating,
    required this.review,
    required this.isReviewed,
    required this.createdAt,
    required this.updatedAt,
    required this.payment,
    required this.productList,
    required this.sales,
  });

  final int id;
  final String address;
  final int uniqueCode;
  final int point;
  final int deposit;
  final int reward;
  final int subTotal;
  final int total;
  final String status;
  final int rating;
  final String review;
  final String isReviewed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TransactionPaymentModel payment;
  final List<TransactionProduct> productList;
  final TransactionSalesModel sales;

  @override
  List<Object?> get props => [
        id,
        address,
        uniqueCode,
        point,
        deposit,
        reward,
        subTotal,
        total,
        status,
        rating,
        review,
        isReviewed,
        createdAt,
        updatedAt,
        payment,
        productList,
        sales,
      ];
}
