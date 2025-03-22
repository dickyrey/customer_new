import 'package:banner_core/domain/entities/banner.dart';
import 'package:banner_core/domain/entities/banner_detail.dart';
import 'package:banner_core/domain/repositories/banner_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

// We want to define an interface for the banner usecase,
// but Dart doesn't allow empty abstract classes.
// ignore: one_member_abstracts
abstract class BannerUsecase {
  Future<Either<Failure, List<Banner>>> getBannerList();
  Future<Either<Failure, BannerDetail>> getBannerDetail(int id);
}

class BannerUsecaseImpl extends BannerUsecase {
  BannerUsecaseImpl(this.repository);

  final BannerRepository repository;

  @override
  Future<Either<Failure, List<Banner>>> getBannerList() {
    return repository.getBannerList();
  }

  @override
  Future<Either<Failure, BannerDetail>> getBannerDetail(int id) {
    return repository.getBannerDetail(id);
  }
}
