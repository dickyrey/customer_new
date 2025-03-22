part of 'review_transaction_watcher_bloc.dart';

@freezed
class ReviewTransactionWatcherState with _$ReviewTransactionWatcherState {
  const factory ReviewTransactionWatcherState.initial() = _Initial;
  const factory ReviewTransactionWatcherState.loading() = _Loading;
  const factory ReviewTransactionWatcherState.error(String message) = _Error;
  const factory ReviewTransactionWatcherState.loaded(
    TransactionDetail transaction,
  ) = _Loaded;
}
