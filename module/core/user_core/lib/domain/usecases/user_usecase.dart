import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:user_core/domain/entities/user.dart';
import 'package:user_core/domain/repositories/user_repository.dart';

abstract class UserUsecase {
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> profile({
    required String fullName,
    required int salesId,
  });
  Future<Either<Failure, bool>> requestOTP(String phoneNumber);
  Future<Either<Failure, bool>> register({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  });
  Future<Either<Failure, bool>> security({
    required String phoneNumber,
    required String otpCode,
  });
}

class UserUsecaseImpl extends UserUsecase {
  UserUsecaseImpl(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, User>> getCurrentUser() {
    return repository.getCurrentUser();
  }

  @override
  Future<Either<Failure, bool>> profile({
    required String fullName,
    required int salesId,
  }) {
    return repository.profile(
      fullName: fullName,
      salesId: salesId,
    );
  }

  @override
  Future<Either<Failure, bool>> requestOTP(String phoneNumber) {
    return repository.requestOTP(phoneNumber);
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
  }) {
    return repository.register(
      streetId: streetId,
      name: name,
      phone: phone,
      address: address,
      type: type,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Future<Either<Failure, bool>> security({
    required String phoneNumber,
    required String otpCode,
  }) {
    return repository.security(
      phoneNumber: phoneNumber,
      otpCode: otpCode,
    );
  }
}
