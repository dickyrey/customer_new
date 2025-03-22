import 'dart:io';

import 'package:deposit_core/data/data_sources/deposit_data_source.dart';
import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:deposit_core/domain/repositories/deposit_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class DepositRepositoryImpl extends DepositRepository {
  DepositRepositoryImpl(this.dataSource);

  final DepositDataSource dataSource;

  @override
  Future<Either<Failure, bool>> cancelDeposit(int id) async {
    try {
      final result = await dataSource.cancelDeposit(id);
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
  Future<Either<Failure, DepositDetail>> createDeposit(int total) async {
    try {
      final result = await dataSource.createDeposit(total);
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
  Future<Either<Failure, List<Deposit>>> getDepositList({
    required int page,
    required String status,
  }) async {
    try {
      final result = await dataSource.getDepositList(
        page: page,
        status: status,
      );
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
  Future<Either<Failure, DepositDetail>> getDepositDetail(int id) async {
    try {
      final result = await dataSource.getDepositDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
