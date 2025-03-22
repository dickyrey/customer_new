part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.fetch(int indexFilter) = _Fetch;
  const factory TransactionWatcherEvent.refresh(int indexFilter) = _Refresh;
  const factory TransactionWatcherEvent.next(int indexFilter) = _Next;
}
