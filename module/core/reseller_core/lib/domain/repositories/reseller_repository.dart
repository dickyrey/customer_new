import 'package:reseller_core/domain/entities/submission.dart';
import 'package:reseller_core/domain/entities/submission_detail.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class ResellerRepository {
  Future<Either<Failure, bool>> cancelSubmission(int id);
  Future<Either<Failure, List<Submission>>> getSubmissionList(int page);
  Future<Either<Failure, SubmissionDetail>> getSubmissionDetail(int id);
  Future<Either<Failure, bool>> submission({
    required int addressId,
    required String name,
  });
}
