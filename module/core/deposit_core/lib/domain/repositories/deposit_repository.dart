import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class DepositRepository {
  Future<Either<Failure, bool>> cancelDeposit(int id);
  Future<Either<Failure, DepositDetail>> createDeposit(int total);
  Future<Either<Failure, List<Deposit>>> getDepositList({
    required int page,
    required String status,
  });
  Future<Either<Failure, DepositDetail>> getDepositDetail(int id);
}
