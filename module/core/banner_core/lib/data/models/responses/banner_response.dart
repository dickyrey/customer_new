import 'package:banner_core/data/models/banner_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class BannerResponse extends Equatable {
  const BannerResponse({
    required this.bannerList,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      bannerList: List<BannerModel>.from(
        (json['data'] as List)
            .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<BannerModel> bannerList;

  @override
  List<Object?> get props => [bannerList];
}
