part of 'submission_detail_watcher_bloc.dart';

@freezed
class SubmissionDetailWatcherEvent with _$SubmissionDetailWatcherEvent {
  const factory SubmissionDetailWatcherEvent.fetch(int id) = _Fetch;
}
