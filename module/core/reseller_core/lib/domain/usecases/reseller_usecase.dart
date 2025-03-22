import 'package:reseller_core/domain/entities/submission.dart';
import 'package:reseller_core/domain/entities/submission_detail.dart';
import 'package:reseller_core/domain/repositories/reseller_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class ResellerUsecase {
  Future<Either<Failure, bool>> cancelSubmission(int id);
  Future<Either<Failure, List<Submission>>> getSubmissionList(int page);
  Future<Either<Failure, SubmissionDetail>> getSubmissionDetail(int id);
  Future<Either<Failure, bool>> submission({
    required int addressId,
    required String name,
  });
}

class ResellerUsecaseImpl extends ResellerUsecase {
  ResellerUsecaseImpl(this.repository);

  final ResellerRepository repository;

  @override
  Future<Either<Failure, bool>> cancelSubmission(int id) {
    return repository.cancelSubmission(id);
  }

  @override
  Future<Either<Failure, List<Submission>>> getSubmissionList(int page) {
    return repository.getSubmissionList(page);
  }

  @override
  Future<Either<Failure, SubmissionDetail>> getSubmissionDetail(int id) {
    return repository.getSubmissionDetail(id);
  }

  @override
  Future<Either<Failure, bool>> submission({
    required int addressId,
    required String name,
  }) {
    return repository.submission(
      addressId: addressId,
      name: name,
    );
  }
}
