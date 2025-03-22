part of 'review_transaction_watcher_bloc.dart';

@freezed
class ReviewTransactionWatcherEvent with _$ReviewTransactionWatcherEvent {
  const factory ReviewTransactionWatcherEvent.fetch(int id) = _Fetch;
}
