import 'package:reseller_core/data/models/submission_detail_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SubmissionDetailResponse extends Equatable {
  const SubmissionDetailResponse({
    required this.submission,
  });

  factory SubmissionDetailResponse.fromJson(Map<String, dynamic> json) {
    return SubmissionDetailResponse(
      submission: SubmissionDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SubmissionDetailModel submission;

  @override
  List<Object?> get props => [submission];
}
