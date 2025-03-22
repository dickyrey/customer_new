part of 'deposit_watcher_bloc.dart';

@freezed
class DepositWatcherEvent with _$DepositWatcherEvent {
  const factory DepositWatcherEvent.fetch(
    int indexFilter,
  ) = _Fetch;
  const factory DepositWatcherEvent.refresh(
    int indexFilter,
  ) = _Refresh;
  const factory DepositWatcherEvent.next(
    int indexFilter,
  ) = _Next;
}
