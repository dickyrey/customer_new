part of 'deposit_detail_watcher_bloc.dart';

@freezed
class DepositDetailWatcherState with _$DepositDetailWatcherState {
  const factory DepositDetailWatcherState.initial() = _Initial;
  const factory DepositDetailWatcherState.loading() = _Loading;
  const factory DepositDetailWatcherState.error(String message) = _Error;
  const factory DepositDetailWatcherState.loaded(
    DepositDetail deposit,
  ) = _Loaded;
}
