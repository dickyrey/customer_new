part of 'submission_watcher_bloc.dart';

@freezed
class SubmissionWatcherEvent with _$SubmissionWatcherEvent {
  const factory SubmissionWatcherEvent.fetch() = _Fetch;
  const factory SubmissionWatcherEvent.refresh() = _Refresh;
  const factory SubmissionWatcherEvent.next() = _Next;
}
