import 'package:reseller_core/data/models/submission_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SubmissionResponse extends Equatable {
  const SubmissionResponse({
    required this.submissionList,
  });

  factory SubmissionResponse.fromJson(Map<String, dynamic> json) {
    return SubmissionResponse(
      submissionList: List<SubmissionModel>.from(
        (json['data'] as List)
            .map((e) => SubmissionModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<SubmissionModel> submissionList;

  @override
  List<Object?> get props => [submissionList];
}
