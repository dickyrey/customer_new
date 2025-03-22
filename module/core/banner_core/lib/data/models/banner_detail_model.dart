import 'package:banner_core/domain/entities/banner_detail.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class BannerDetailModel extends Equatable {
  const BannerDetailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerDetailModel.fromJson(Map<String, dynamic> json) =>
      BannerDetailModel(
        id: json['id'] as int,
        title: json['title'] as String,
        content: json['content'] as String,
        image: json['image'] as String,
        url: json['url'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  BannerDetail toEntity() {
    return BannerDetail(
      id: id,
      title: title,
      content: content,
      image: image,
      url: url,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

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
