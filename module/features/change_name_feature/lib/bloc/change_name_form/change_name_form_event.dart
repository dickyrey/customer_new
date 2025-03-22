part of 'change_name_form_bloc.dart';

@freezed
class ChangeNameFormEvent with _$ChangeNameFormEvent {
  const factory ChangeNameFormEvent.fullName(String val) = _FullName;
  const factory ChangeNameFormEvent.save() = _Save;

  // Sales
  const factory ChangeNameFormEvent.fetchSales(User user) = _FetchSales;
  const factory ChangeNameFormEvent.selectSales(Sales v) = _SelectSales;
}
