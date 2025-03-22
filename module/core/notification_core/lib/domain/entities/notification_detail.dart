import 'package:shared_libraries/equatable/equatable.dart';

class NotificationDetail extends Equatable {
  const NotificationDetail({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.isReaded,
    required this.createdAt,
    required this.updatedAt,
  });

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
