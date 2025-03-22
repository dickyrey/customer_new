import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:deposit_core/domain/repositories/deposit_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

// ignore: one_member_abstracts
abstract class DepositUsecase {
  Future<Either<Failure, bool>> cancelDeposit(int id);
  Future<Either<Failure, DepositDetail>> createDeposit(int total);
  Future<Either<Failure, List<Deposit>>> getDepositList({
    required int page,
    required String status,
  });
  Future<Either<Failure, DepositDetail>> getDepositDetail(int id);
}

class DepositUsecaseImpl extends DepositUsecase {
  DepositUsecaseImpl(this.repository);

  final DepositRepository repository;

  @override
  Future<Either<Failure, bool>> cancelDeposit(int id) {
    return repository.cancelDeposit(id);
  }

  @override
  Future<Either<Failure, DepositDetail>> createDeposit(int total) {
    return repository.createDeposit(total);
  }

  @override
  Future<Either<Failure, DepositDetail>> getDepositDetail(int id) {
    return repository.getDepositDetail(id);
  }

  @override
  Future<Either<Failure, List<Deposit>>> getDepositList({
    required int page,
    required String status,
  }) {
    return repository.getDepositList(
      page: page,
      status: status,
    );
  }
}
