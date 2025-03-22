import 'package:shared_libraries/equatable/equatable.dart';

class OTP extends Equatable {
  const OTP({
    required this.token,
    required this.isRegistered,
  });

  final String token;
  final String isRegistered;

  @override
  List<Object?> get props => [token, isRegistered];
}
