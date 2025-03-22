import 'dart:io';

import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:user_core/data/data_sources/user_data_source.dart';
import 'package:user_core/domain/entities/user.dart';
import 'package:user_core/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final result = await dataSource.getCurrentUser();
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> profile({
    required String fullName,
    required int salesId,
  }) async {
    try {
      final result = await dataSource.profile(
        fullName: fullName,
        salesId: salesId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> requestOTP(String phoneNumber) async {
    try {
      final result = await dataSource.requestOTP(phoneNumber);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> register({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final result = await dataSource.register(
        streetId: streetId,
        phone: phone,
        name: name,
        address: address,
        type: type,
        latitude: latitude,
        longitude: longitude,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> security({
    required String phoneNumber,
    required String otpCode,
  }) async {
    try {
      final result = await dataSource.security(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
