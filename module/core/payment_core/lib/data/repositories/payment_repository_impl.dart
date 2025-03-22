import 'dart:io';

import 'package:payment_core/data/data_sources/payment_data_source.dart';
import 'package:payment_core/domain/entities/payment.dart';
import 'package:payment_core/domain/repositories/payment_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  PaymentRepositoryImpl(this.dataSource);

  final PaymentDataSource dataSource;

  @override
  Future<Either<Failure, List<Payment>>> getPaymentList() async {
    try {
      final result = await dataSource.getPaymentList();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
