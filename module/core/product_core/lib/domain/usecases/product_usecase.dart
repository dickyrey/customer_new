import 'package:product_core/domain/entities/product.dart';
import 'package:product_core/domain/repositories/product_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

//
// ignore: one_member_abstracts
abstract class ProductUsecase {
  Future<Either<Failure, List<Product>>> getProductList();
}

class ProductUsecaseImpl extends ProductUsecase {
  ProductUsecaseImpl(this.repository);

  final ProductRepository repository;

  @override
  Future<Either<Failure, List<Product>>> getProductList() {
    return repository.getProductList();
  }
}
