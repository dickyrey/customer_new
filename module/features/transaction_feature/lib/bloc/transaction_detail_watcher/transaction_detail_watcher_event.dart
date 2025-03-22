part of 'transaction_detail_watcher_bloc.dart';

@freezed
class TransactionDetailWatcherEvent with _$TransactionDetailWatcherEvent {
  const factory TransactionDetailWatcherEvent.fetch(int id) = _Fetch;
}
