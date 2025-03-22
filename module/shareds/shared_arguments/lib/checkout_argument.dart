import 'package:user_core/domain/entities/user.dart';

class CheckoutArgument {
  CheckoutArgument({
    required this.qty,
    required this.total,
    required this.user,
  });
  final int qty;
  final int total;
  final User user;
}
