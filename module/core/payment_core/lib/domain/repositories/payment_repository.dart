import 'package:payment_core/domain/entities/payment.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

//
// ignore: one_member_abstracts
abstract class PaymentRepository {
  Future<Either<Failure, List<Payment>>> getPaymentList();
}
