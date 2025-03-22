import 'package:shared_libraries/equatable/equatable.dart';

class TransactionProduct extends Equatable {
  const TransactionProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.amount,
    required this.total,
  });

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
