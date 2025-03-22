part of 'banner_detail_watcher_bloc.dart';

@freezed
class BannerDetailWatcherEvent with _$BannerDetailWatcherEvent {
  const factory BannerDetailWatcherEvent.fetch(
    int id,
  ) = _Fetch;
}
