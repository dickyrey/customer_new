part of 'submission_detail_watcher_bloc.dart';

@freezed
class SubmissionDetailWatcherState with _$SubmissionDetailWatcherState {
  const factory SubmissionDetailWatcherState.initial() = _Initial;
  const factory SubmissionDetailWatcherState.loading() = _Loading;
  const factory SubmissionDetailWatcherState.failed(String message) = _Failed;
  const factory SubmissionDetailWatcherState.loaded(
    SubmissionDetail submission,
  ) = _Loaded;
}
