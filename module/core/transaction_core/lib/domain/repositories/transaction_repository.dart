import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:transaction_core/domain/entities/transaction.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';

abstract class TransactionRepository {
  Future<Either<Failure, bool>> cancelTransaction(int id);
  Future<Either<Failure, TransactionDetail>> completeTransaction(int id);
  Future<Either<Failure, TransactionDetail>> createTransaction({
    required int addressId,
    required int paymentId,
    required String jsonString,
    required bool isUsePoint,
  });
  Future<Either<Failure, List<Transaction>>> getTransactionList({
    required int page,
    required String status,
  });
  Future<Either<Failure, TransactionDetail>> getTransactionDetail(int id);
  Future<Either<Failure, bool>> reviewTransaction({
    required int id,
    required int rating,
    required String review,
  });
}
