part of 'submission_cancel_actor_bloc.dart';

@freezed
class SubmissionCancelActorState with _$SubmissionCancelActorState {
  const factory SubmissionCancelActorState.initial() = _Initial;
  const factory SubmissionCancelActorState.loading() = _Lading;
  const factory SubmissionCancelActorState.failed(String message) = _Failed;
  const factory SubmissionCancelActorState.loaded() = _Loaded;
}
