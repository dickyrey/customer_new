import 'package:authentication_core/domain/entities/otp.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class OTPModel extends Equatable {
  const OTPModel({
    required this.token,
    required this.isRegistered,
  });

  factory OTPModel.fromJson(Map<String, dynamic> json) => OTPModel(
        token: json['token'] as String,
        isRegistered: json['is_registered'] as String,
      );

  final String token;
  final String isRegistered;

  OTP toEntity() {
    return OTP(token: token, isRegistered: isRegistered);
  }

  @override
  List<Object?> get props => [token, isRegistered];
}
