import 'package:notification_core/data/models/notification_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class NotificationResponse extends Equatable {
  const NotificationResponse({
    required this.notificationList,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      notificationList: List<NotificationModel>.from(
        (json['data'] as List)
            .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<NotificationModel> notificationList;

  @override
  List<Object?> get props => [notificationList];
}
