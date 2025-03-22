import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:user_core/domain/entities/user.dart';

abstract class UserRepository {
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
