part of 'signup_form_bloc.dart';

@freezed
class SignupFormEvent with _$SignupFormEvent {
  // Address
  const factory SignupFormEvent.address(
    String v,
  ) = _Address;

  // Street
  const factory SignupFormEvent.fetchStreet() = _FetchStreet;
  const factory SignupFormEvent.selectStreet(
    Street v,
  ) = _SelectStreet;

  // Google Maps
  const factory SignupFormEvent.onMapCreated({
    required GoogleMapController controller,
    required LatLng latLng,
  }) = _OnMapCreated;
  const factory SignupFormEvent.onMapTapped({
    required GoogleMapController controller,
    required LatLng latLng,
  }) = _OnMapTapped;
  const factory SignupFormEvent.updateMarker(
    Position position,
  ) = _UpdataMarker;

  // Type
  const factory SignupFormEvent.selectedAddressType(
    String v,
  ) = _SelectedAddressType;

  // User
  const factory SignupFormEvent.name(
    String v,
  ) = _Name;
  const factory SignupFormEvent.phone(
    String v,
  ) = _Phone;

  // Send to API
  const factory SignupFormEvent.send() = _Send;
}
