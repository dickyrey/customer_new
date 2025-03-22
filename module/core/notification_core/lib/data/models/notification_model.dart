import 'package:notification_core/domain/entities/notification.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.id,
    required this.title,
    required this.type,
    required this.isReaded,
    required this.createdAt,
    required this.updatedAt,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    final isRead = json['is_readed'] == '1';

    return NotificationModel(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      isReaded: isRead,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Notifications toEntity() {
    return Notifications(
      id: id,
      title: title,
      type: type,
      isReaded: isReaded,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  final int id;
  final String title;
  final String type;
  final bool isReaded;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        isReaded,
        createdAt,
        updatedAt,
      ];
}
