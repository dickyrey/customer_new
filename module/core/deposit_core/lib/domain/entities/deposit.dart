import 'package:shared_libraries/equatable/equatable.dart';

class Deposit extends Equatable {
  const Deposit({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
  });

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
