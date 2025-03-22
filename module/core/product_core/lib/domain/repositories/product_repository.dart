import 'package:product_core/domain/entities/product.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductList();
  Future<Either<Failure, Product>> getProductDetail(int id);
}
