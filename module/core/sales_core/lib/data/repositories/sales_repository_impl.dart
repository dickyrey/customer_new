import 'dart:io';

import 'package:sales_core/data/data_sources/sales_data_source.dart';
import 'package:sales_core/domain/entities/sales.dart';
import 'package:sales_core/domain/repositories/sales_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class SalesRepositoryImpl extends SalesRepository {
  SalesRepositoryImpl(this.dataSource);

  final SalesDataSource dataSource;

  @override
  Future<Either<Failure, List<Sales>>> getSalesList() async {
    try {
      final result = await dataSource.getSalesList();
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
