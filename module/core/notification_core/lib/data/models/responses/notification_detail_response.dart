import 'package:notification_core/data/models/notification_detail_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class NotificationDetailResponse extends Equatable {
  const NotificationDetailResponse({
    required this.notification,
  });

  factory NotificationDetailResponse.fromJson(Map<String, dynamic> json) {
    return NotificationDetailResponse(
      notification: NotificationDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NotificationDetailModel notification;

  @override
  List<Object?> get props => [notification];
}
