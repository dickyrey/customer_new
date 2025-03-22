part of 'submission_form_bloc.dart';

@freezed
class SubmissionFormEvent with _$SubmissionFormEvent {
  // Address
  const factory SubmissionFormEvent.fetchAddress() = _FetchAddress;
  const factory SubmissionFormEvent.selectAddress(
    Address address,
  ) = _SelectAddress;

  // Store
  const factory SubmissionFormEvent.onChanged(
    String v,
  ) = _OnChanged;

  // Send to API
  const factory SubmissionFormEvent.send() = _Send;
}
