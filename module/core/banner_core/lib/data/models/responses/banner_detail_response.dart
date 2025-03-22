import 'package:banner_core/data/models/banner_detail_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class BannerDetailResponse extends Equatable {
  const BannerDetailResponse({
    required this.banner,
  });

  factory BannerDetailResponse.fromJson(Map<String, dynamic> json) {
    return BannerDetailResponse(
      banner: BannerDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final BannerDetailModel banner;

  @override
  List<Object?> get props => [banner];
}
