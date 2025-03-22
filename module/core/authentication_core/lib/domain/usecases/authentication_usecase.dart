import 'package:authentication_core/domain/entities/otp.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/injectable/injectable.dart';

abstract class AuthenticationUsecase {
  Future<Either<Failure, bool>> signIn(String phoneNumber);
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, OTP>> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  });
}

@Injectable(as: AuthenticationUsecase)
class AuthenticationUsecaseImpl extends AuthenticationUsecase {
  AuthenticationUsecaseImpl(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, bool>> signIn(String phoneNumber) {
    return repository.signIn(phoneNumber);
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    return repository.signOut();
  }

  @override
  Future<Either<Failure, OTP>> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  }) {
    return repository.verificationOTP(
      phoneNumber: phoneNumber,
      otpCode: otpCode,
    );
  }
}
