import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class NotificationDetailModel extends Equatable {
  const NotificationDetailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.isReaded,
    required this.createdAt,
    required this.updatedAt,
  });
  factory NotificationDetailModel.fromJson(Map<String, dynamic> json) {
    final isRead = json['is_readed'] == '1';

    return NotificationDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      isReaded: isRead,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  NotificationDetail toEntity() {
    return NotificationDetail(
      id: id,
      title: title,
      content: content,
      type: type,
      isReaded: isReaded,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  final int id;
  final String title;
  final String content;
  final String type;
  final bool isReaded;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        type,
        isReaded,
        createdAt,
        updatedAt,
      ];
}
