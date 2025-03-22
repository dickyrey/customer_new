part of 'banner_watcher_bloc.dart';

@freezed
class BannerWatcherState with _$BannerWatcherState {
  const factory BannerWatcherState.initial() = _Initial;
  const factory BannerWatcherState.loading() = _Lading;
  const factory BannerWatcherState.failed(String message) = _Failed;
  const factory BannerWatcherState.loaded(List<Banner> bannerList) = _Loaded;
}
