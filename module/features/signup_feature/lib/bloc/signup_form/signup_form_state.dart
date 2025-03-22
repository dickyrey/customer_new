part of 'signup_form_bloc.dart';

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    required RequestState state,
    required String message,
    required bool isSubmit,
    required bool isFetchingStreet,

    // Address
    required String address,

    // Google Map
    required bool isMapLoading,
    required LatLng? initialLatLng,
    required LatLng? selectedLatLng,
    required Set<Marker> markers,

    // Type
    required String selectedAddressType,
    required List<String> addressTypeList,

    // Street
    required Street? selectedStreet,
    required List<Street> streetList,

    // Users
    required String name,
    required String phone,
  }) = _SignupFormState;

  factory SignupFormState.initial() {
    return const SignupFormState(
      state: RequestState.empty,
      message: '',
      isSubmit: false,
      isFetchingStreet: false,

      // Address
      address: '',

      // Google Maps
      isMapLoading: false,
      initialLatLng: null,
      selectedLatLng: null,
      markers: {},
      // Type
      selectedAddressType: '',
      addressTypeList: [
        'home',
        'office',
        'outlet',
        'etc',
      ],

      // Street
      selectedStreet: null,
      streetList: [],

      // User
      name: '',
      phone: '',
    );
  }
}
