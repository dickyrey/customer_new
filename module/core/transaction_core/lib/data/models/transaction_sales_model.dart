import 'package:shared_libraries/equatable/equatable.dart';
import 'package:transaction_core/domain/entities/transaction_sales.dart';

class TransactionSalesModel extends Equatable {
  const TransactionSalesModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.rating,
    required this.status,
  });

  factory TransactionSalesModel.fromJson(Map<String, dynamic> json) =>
      TransactionSalesModel(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as String,
        image: json['image'] as String,
        rating: json['rating'] as int,
        status: json['status'] as String,
      );

  TransactionSales toEntity() {
    return TransactionSales(
      id: id,
      name: name,
      phone: phone,
      image: image,
      rating: rating,
      status: status,
    );
  }

  final int id;
  final String name;
  final String phone;
  final String image;
  final int rating;
  final String status;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        image,
        rating,
        status,
      ];
}
