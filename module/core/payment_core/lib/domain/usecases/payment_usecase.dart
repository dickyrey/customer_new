import 'package:payment_core/domain/entities/payment.dart';
import 'package:payment_core/domain/repositories/payment_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

//
// ignore: one_member_abstracts
abstract class PaymentUsecase {
  Future<Either<Failure, List<Payment>>> getPaymentList();
}

class PaymentUsecaseImpl extends PaymentUsecase {
  PaymentUsecaseImpl(this.repository);

  final PaymentRepository repository;

  @override
  Future<Either<Failure, List<Payment>>> getPaymentList() {
    return repository.getPaymentList();
  }
}
