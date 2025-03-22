part of 'address_watcher_bloc.dart';

@freezed
class AddressWatcherEvent with _$AddressWatcherEvent {
  const factory AddressWatcherEvent.fetch() = _Fetch;
}
