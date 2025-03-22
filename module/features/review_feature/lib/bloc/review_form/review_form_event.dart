part of 'review_form_bloc.dart';

@freezed
class ReviewFormEvent with _$ReviewFormEvent {
  const factory ReviewFormEvent.starsOnChanged(
    double v,
  ) = _StarsOnChanged;
  const factory ReviewFormEvent.reviewOnChanged(
    String v,
  ) = _ReviewOnChanged;
  const factory ReviewFormEvent.send(
    int orderId,
  ) = _Send;
}
