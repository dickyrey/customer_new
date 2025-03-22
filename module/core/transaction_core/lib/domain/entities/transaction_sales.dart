import 'package:shared_libraries/equatable/equatable.dart';

class TransactionSales extends Equatable {
  const TransactionSales({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.rating,
    required this.status,
  });

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
