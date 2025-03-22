import 'dart:io';

import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:transaction_core/data/data_sources/transaction_data_source.dart';
import 'package:transaction_core/domain/entities/transaction.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRepositoryImpl(this.dataSource);

  final TransactionDataSource dataSource;

  @override
  Future<Either<Failure, bool>> cancelTransaction(int id) async {
    try {
      final result = await dataSource.cancelTransaction(id);
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
  Future<Either<Failure, TransactionDetail>> completeTransaction(int id) async {
    try {
      final result = await dataSource.completeTransaction(id);
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
  Future<Either<Failure, TransactionDetail>> createTransaction({
    required int addressId,
    required int paymentId,
    required String jsonString,
    required bool isUsePoint,
  }) async {
    try {
      final result = await dataSource.createTransaction(
        addressId: addressId,
        paymentId: paymentId,
        jsonString: jsonString,
        isUsePoint: isUsePoint,
      );
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
  Future<Either<Failure, TransactionDetail>> getTransactionDetail(
    int id,
  ) async {
    try {
      final result = await dataSource.getTransactionDetail(id);
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
  Future<Either<Failure, List<Transaction>>> getTransactionList({
    required int page,
    required String status,
  }) async {
    try {
      final result = await dataSource.getTransactionList(
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
  Future<Either<Failure, bool>> reviewTransaction({
    required int id,
    required int rating,
    required String review,
  }) async {
    try {
      final result = await dataSource.reviewTransaction(
        id: id,
        rating: rating,
        review: review,
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
