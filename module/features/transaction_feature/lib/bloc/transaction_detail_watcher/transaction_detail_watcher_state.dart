part of 'transaction_detail_watcher_bloc.dart';

@freezed
class TransactionDetailWatcherState with _$TransactionDetailWatcherState {
  const factory TransactionDetailWatcherState.initial() = _Initial;
  const factory TransactionDetailWatcherState.loading() = _Loading;
  const factory TransactionDetailWatcherState.error(String message) = _Error;
  const factory TransactionDetailWatcherState.loaded(
    TransactionDetail transaction,
  ) = _Loaded;
}
