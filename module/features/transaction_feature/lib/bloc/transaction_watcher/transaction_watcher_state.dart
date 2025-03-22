part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherState with _$TransactionWatcherState {
  const factory TransactionWatcherState.initial() = _Initial;
  const factory TransactionWatcherState.loading() = _Loading;
  const factory TransactionWatcherState.failed(String message) = _Failed;
  const factory TransactionWatcherState.loaded({
    required bool hasReachedMax,
    required List<Transaction> transactionList,
  }) = _Loaded;
}
