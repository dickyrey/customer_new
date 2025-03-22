import 'dart:io';

import 'package:reseller_core/data/data_sources/reseller_data_source.dart';
import 'package:reseller_core/domain/entities/submission.dart';
import 'package:reseller_core/domain/entities/submission_detail.dart';
import 'package:reseller_core/domain/repositories/reseller_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class ResellerRepositoryImpl extends ResellerRepository {
  ResellerRepositoryImpl(this.dataSource);

  final ResellerDataSource dataSource;

  @override
  Future<Either<Failure, bool>> cancelSubmission(int id) async {
    try {
      final result = await dataSource.cancelSubmission(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, List<Submission>>> getSubmissionList(int page) async {
    try {
      final result = await dataSource.getSubmissionList(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, SubmissionDetail>> getSubmissionDetail(
    int id,
  ) async {
    try {
      final result = await dataSource.getSubmissionDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> submission({
    required int addressId,
    required String name,
  }) async {
    try {
      final result = await dataSource.submission(
        addressId: addressId,
        name: name,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
