import 'package:shared_libraries/equatable/equatable.dart';

class SubmissionDetail extends Equatable {
  const SubmissionDetail({
    required this.id,
    required this.address,
    required this.store,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String address;
  final String store;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        address,
        store,
        status,
        createdAt,
        updatedAt,
      ];
}
