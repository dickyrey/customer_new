part of 'address_watcher_bloc.dart';

@freezed
class AddressWatcherState with _$AddressWatcherState {
  const factory AddressWatcherState.initial() = _Initial;
  const factory AddressWatcherState.loading() = _Lading;
  const factory AddressWatcherState.failed(String message) = _Failed;
  const factory AddressWatcherState.loaded(List<Address> addressList) = _Loaded;
}
