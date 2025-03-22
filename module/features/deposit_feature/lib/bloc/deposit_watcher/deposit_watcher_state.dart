part of 'deposit_watcher_bloc.dart';

@freezed
class DepositWatcherState with _$DepositWatcherState {
  const factory DepositWatcherState.initial() = _Initial;
  const factory DepositWatcherState.loading() = _Loading;
  const factory DepositWatcherState.failed(String message) = _Failed;
  const factory DepositWatcherState.loaded({
    required bool hasReachedMax,
    required List<Deposit> depositList,
  }) = _Loaded;
}
