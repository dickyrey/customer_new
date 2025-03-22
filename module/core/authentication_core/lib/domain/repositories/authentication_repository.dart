import 'package:authentication_core/domain/entities/otp.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> signIn(String phoneNumber);
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, OTP>> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  });
}
