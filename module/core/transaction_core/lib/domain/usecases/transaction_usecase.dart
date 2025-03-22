import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:transaction_core/domain/entities/transaction.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/repositories/transaction_repository.dart';

abstract class TransactionUsecase {
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

class TransactionUsecaseImpl extends TransactionUsecase {
  TransactionUsecaseImpl(this.repository);

  final TransactionRepository repository;

  @override
  Future<Either<Failure, bool>> cancelTransaction(int id) {
    return repository.cancelTransaction(id);
  }

  @override
  Future<Either<Failure, TransactionDetail>> completeTransaction(int id) {
    return repository.completeTransaction(id);
  }

  @override
  Future<Either<Failure, TransactionDetail>> createTransaction({
    required int addressId,
    required int paymentId,
    required String jsonString,
    required bool isUsePoint,
  }) {
    return repository.createTransaction(
      addressId: addressId,
      paymentId: paymentId,
      jsonString: jsonString,
      isUsePoint: isUsePoint,
    );
  }

  @override
  Future<Either<Failure, TransactionDetail>> getTransactionDetail(int id) {
    return repository.getTransactionDetail(id);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionList({
    required int page,
    required String status,
  }) {
    return repository.getTransactionList(
      page: page,
      status: status,
    );
  }

  @override
  Future<Either<Failure, bool>> reviewTransaction({
    required int id,
    required int rating,
    required String review,
  }) {
    return repository.reviewTransaction(id: id, rating: rating, review: review);
  }
}
