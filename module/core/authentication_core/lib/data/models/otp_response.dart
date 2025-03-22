import 'package:authentication_core/data/models/otp_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class OTPResponse extends Equatable {
  const OTPResponse({
    required this.otp,
  });

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      otp: OTPModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final OTPModel otp;

  @override
  List<Object?> get props => [otp];
}
