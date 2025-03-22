import 'package:banner_core/data/data_sources/banner_data_source.dart';
import 'package:banner_core/data/repositories/banner_repository_impl.dart';
import 'package:banner_core/domain/repositories/banner_repository.dart';
import 'package:banner_core/domain/usecases/banner_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class BannerCoreInjection {
  BannerCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<BannerDataSource>(
      () => BannerDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<BannerRepository>(
      () => BannerRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<BannerUsecase>(
      () => BannerUsecaseImpl(locator()),
    );
  }
}
