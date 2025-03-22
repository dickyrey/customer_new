import 'package:banner_feature/bloc/banner_detail_watcher/banner_detail_watcher_bloc.dart';
import 'package:banner_feature/bloc/banner_watcher/banner_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class BannerFeatureInjection {
  BannerFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => BannerDetailWatcherBloc(
          locator(),
        ),
      )
      ..registerLazySingleton(
        () => BannerWatcherBloc(
          locator(),
        ),
      );
  }
}
