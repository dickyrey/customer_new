import 'package:shared_libraries/equatable/equatable.dart';

class TransactionPayment extends Equatable {
  const TransactionPayment({
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
