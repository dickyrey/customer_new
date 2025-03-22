import 'package:banner_core/domain/entities/banner.dart';
import 'package:banner_core/domain/entities/banner_detail.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

// We want to define an interface for the banner repository,
// but Dart doesn't allow empty abstract classes.
// ignore: one_member_abstracts
abstract class BannerRepository {
  Future<Either<Failure, List<Banner>>> getBannerList();
  Future<Either<Failure, BannerDetail>> getBannerDetail(int id);
}
