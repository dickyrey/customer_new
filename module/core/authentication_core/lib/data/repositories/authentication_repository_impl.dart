import 'dart:io';

import 'package:authentication_core/data/data_sources/authentication_data_source.dart';
import 'package:authentication_core/domain/entities/otp.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this.dataSource);

  final AuthenticationDataSource dataSource;

  @override
  Future<Either<Failure, bool>> signIn(String phoneNumber) async {
    try {
      final result = await dataSource.signIn(phoneNumber);
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
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await dataSource.signOut();
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
  Future<Either<Failure, OTP>> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  }) async {
    try {
      final result = await dataSource.verificationOTP(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
      );
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
