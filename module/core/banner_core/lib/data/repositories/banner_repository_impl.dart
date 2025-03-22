import 'dart:io';

import 'package:banner_core/data/data_sources/banner_data_source.dart';
import 'package:banner_core/domain/entities/banner.dart';
import 'package:banner_core/domain/entities/banner_detail.dart';
import 'package:banner_core/domain/repositories/banner_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class BannerRepositoryImpl extends BannerRepository {
  BannerRepositoryImpl(this.dataSource);

  final BannerDataSource dataSource;

  @override
  Future<Either<Failure, List<Banner>>> getBannerList() async {
    try {
      final result = await dataSource.getBannerList();
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
  Future<Either<Failure, BannerDetail>> getBannerDetail(int id) async {
    try {
      final result = await dataSource.getBannerDetail(id);
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
