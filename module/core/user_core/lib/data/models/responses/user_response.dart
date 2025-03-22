import 'package:shared_libraries/equatable/equatable.dart';
import 'package:user_core/data/models/user_model.dart';

class UserResponse extends Equatable {
  const UserResponse({
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: UserModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final UserModel user;

  @override
  List<Object?> get props => [user];
}
