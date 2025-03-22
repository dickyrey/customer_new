import 'dart:io';

import 'package:product_core/data/data_sources/product_data_source.dart';
import 'package:product_core/domain/entities/product.dart';
import 'package:product_core/domain/repositories/product_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this.dataSource);

  final ProductDataSource dataSource;

  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    try {
      final result = await dataSource.getProductList();
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
  Future<Either<Failure, Product>> getProductDetail(int id) async {
    try {
      final result = await dataSource.getProductDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
