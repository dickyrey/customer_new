part of 'submission_watcher_bloc.dart';

@freezed
class SubmissionWatcherState with _$SubmissionWatcherState {
  const factory SubmissionWatcherState.initial() = _Initial;
  const factory SubmissionWatcherState.loading() = _Loading;
  const factory SubmissionWatcherState.failed(String message) = _Failed;
  const factory SubmissionWatcherState.loaded({
    required bool hasReachedMax,
    required List<Submission> submissionList,
  }) = _Loaded;
}
