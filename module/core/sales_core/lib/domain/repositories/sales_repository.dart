import 'package:sales_core/domain/entities/sales.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

//
// ignore: one_member_abstracts
abstract class SalesRepository {
  Future<Either<Failure, List<Sales>>> getSalesList();
}
