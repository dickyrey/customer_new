import 'package:sales_core/domain/entities/sales.dart';
import 'package:sales_core/domain/repositories/sales_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

// ignore: one_member_abstracts
abstract class SalesUsecase {
  Future<Either<Failure, List<Sales>>> getSalesList();
}

class SalesUsecaseImpl extends SalesUsecase {
  SalesUsecaseImpl(this.salesRepository);

  final SalesRepository salesRepository;

  @override
  Future<Either<Failure, List<Sales>>> getSalesList() {
    return salesRepository.getSalesList();
  }
}
