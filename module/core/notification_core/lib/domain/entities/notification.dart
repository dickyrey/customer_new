import 'package:shared_libraries/equatable/equatable.dart';

class Notifications extends Equatable {
  const Notifications({
    required this.id,
    required this.title,
    required this.type,
    required this.isReaded,
    required this.createdAt,
    required this.updatedAt,
  });

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
