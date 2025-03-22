import 'package:shared_libraries/equatable/equatable.dart';

class BannerDetail extends Equatable {
  const BannerDetail({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String content;
  final String image;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        image,
        url,
        createdAt,
        updatedAt,
      ];
}
