import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/data/models/transaction_payment_model.dart';
import 'package:transaction_core/data/models/transaction_product_model.dart';
import 'package:transaction_core/data/models/transaction_sales_model.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';

class TransactionDetailModel extends Equatable {
  const TransactionDetailModel({
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

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailModel(
        id: json['id'] as int,
        address: json['address'] as String,
        uniqueCode: json['unique_code'] as int,
        point: json['point'] as int,
        deposit: json['deposit'] as int,
        reward: json['reward'] as int,
        subTotal: json['sub_total'] as int,
        total: json['total'] as int,
        status: json['status'] as String,
        rating: json['rating'] as int,
        review: json['review'] as String,
        isReviewed: json['is_reviewed'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        payment: TransactionPaymentModel.fromJson(
          json['payment'] as Map<String, dynamic>,
        ),
        productList: List<TransactionProductModel>.from(
          (json['products'] as Iterable<dynamic>).map(
            (e) => TransactionProductModel.fromJson(
              e as Map<String, dynamic>,
            ),
          ),
        ),
        sales: TransactionSalesModel.fromJson(
          json['sales'] as Map<String, dynamic>,
        ),
      );

  TransactionDetail toEntity() {
    return TransactionDetail(
      id: id,
      address: address,
      uniqueCode: uniqueCode,
      point: point,
      deposit: deposit,
      reward: reward,
      subTotal: subTotal,
      total: total,
      status: status,
      rating: rating,
      review: review,
      isReviewed: isReviewed,
      createdAt: createdAt,
      updatedAt: updatedAt,
      payment: payment,
      productList: productList.map((e) => e.toEntity()).toList(),
      sales: sales,
    );
  }

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
  final List<TransactionProductModel> productList;
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
