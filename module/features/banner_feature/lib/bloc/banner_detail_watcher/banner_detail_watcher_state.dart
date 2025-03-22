part of 'banner_detail_watcher_bloc.dart';

@freezed
class BannerDetailWatcherState with _$BannerDetailWatcherState {
  const factory BannerDetailWatcherState.initial() = _Initial;
  const factory BannerDetailWatcherState.loading() = _Lading;
  const factory BannerDetailWatcherState.failed(String message) = _Failed;
  const factory BannerDetailWatcherState.loaded(BannerDetail banner) = _Loaded;
}
