import 'package:reseller_core/domain/entities/submission_detail.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SubmissionDetailModel extends Equatable {
  const SubmissionDetailModel({
    required this.id,
    required this.address,
    required this.store,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubmissionDetailModel.fromJson(Map<String, dynamic> json) =>
      SubmissionDetailModel(
        id: json['id'] as int,
        address: json['address'] as String,
        store: json['store'] as String,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  SubmissionDetail toEntity() {
    return SubmissionDetail(
      id: id,
      address: address,
      store: store,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

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
