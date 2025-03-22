part of 'deposit_detail_watcher_bloc.dart';

@freezed
class DepositDetailWatcherEvent with _$DepositDetailWatcherEvent {
  const factory DepositDetailWatcherEvent.fetch(
    int id,
  ) = _Fetch;
}
