import 'package:shared_libraries/equatable/equatable.dart';

class Submission extends Equatable {
  const Submission({
    required this.id,
    required this.store,
    required this.status,
    required this.createdAt,
  });

  final int id;
  final String store;
  final String status;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        store,
        status,
        createdAt,
      ];
}
