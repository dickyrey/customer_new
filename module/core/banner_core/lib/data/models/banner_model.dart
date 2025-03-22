import 'package:banner_core/domain/entities/banner.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class BannerModel extends Equatable {
  const BannerModel({
    required this.id,
    required this.image,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] as int,
        image: json['image'] as String,
      );

  Banner toEntity() {
    return Banner(
      id: id,
      image: image,
    );
  }

  final int id;
  final String image;

  @override
  List<Object?> get props => [
        id,
        image,
      ];
}
