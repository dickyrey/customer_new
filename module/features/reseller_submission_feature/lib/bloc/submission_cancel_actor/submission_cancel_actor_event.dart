part of 'submission_cancel_actor_bloc.dart';

@freezed
class SubmissionCancelActorEvent with _$SubmissionCancelActorEvent {
  const factory SubmissionCancelActorEvent.cancel(int id) = _Cancel;
}
