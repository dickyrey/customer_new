part of 'address_form_bloc.dart';

@freezed
class AddressFormEvent with _$AddressFormEvent {
  // Address
  const factory AddressFormEvent.address(
    String v,
  ) = _Address;

  // Street
  const factory AddressFormEvent.fetchAddress(
    AddressArgument args,
  ) = _FetchAddress;
  const factory AddressFormEvent.fetchStreet(
    String street,
  ) = _FetchStreet;
  const factory AddressFormEvent.selectStreet(
    Street v,
  ) = _SelectStreet;

  // Google Maps
  const factory AddressFormEvent.onMapCreated({
    required GoogleMapController controller,
    required LatLng latLng,
  }) = _OnMapCreated;
  const factory AddressFormEvent.onMapTapped({
    required GoogleMapController controller,
    required LatLng latLng,
  }) = _OnMapTapped;
  const factory AddressFormEvent.updateMarker(
    Position position,
  ) = _UpdataMarker;

  // Type
  const factory AddressFormEvent.selectedAddressType(
    String v,
  ) = _SelectedAddressType;

  // User
  const factory AddressFormEvent.name(
    String v,
  ) = _Name;
  const factory AddressFormEvent.phone(
    String v,
  ) = _Phone;

  // Send to API
  const factory AddressFormEvent.create() = _Create;
  const factory AddressFormEvent.update(int id) = _Update;
}
