import 'package:reseller_core/domain/entities/submission.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SubmissionModel extends Equatable {
  const SubmissionModel({
    required this.id,
    required this.store,
    required this.status,
    required this.createdAt,
  });

  factory SubmissionModel.fromJson(Map<String, dynamic> json) {
    return SubmissionModel(
      id: json['id'] as int,
      store: json['store'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Submission toEntity() {
    return Submission(
      id: id,
      store: store,
      status: status,
      createdAt: createdAt,
    );
  }

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
