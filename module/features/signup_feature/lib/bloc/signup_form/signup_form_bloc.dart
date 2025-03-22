import 'package:address_core/domain/entities/street.dart';
import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:user_core/domain/usecases/user_usecase.dart';

part 'signup_form_bloc.freezed.dart';
part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  SignupFormBloc(
    this._addressCase,
    this._userCase,
  ) : super(SignupFormState.initial()) {
    on<SignupFormEvent>((event, emit) async {
      await event.map(
        address: (event) {
          emit(
            state.copyWith(
              address: event.v,
              message: '',
              state: RequestState.empty,
              isFetchingStreet: false,
              isMapLoading: false,
              isSubmit: false,
            ),
          );
        },
        fetchStreet: (event) async {
          emit(
            state.copyWith(
              state: RequestState.empty,
              isFetchingStreet: true,
              message: '',
              selectedStreet: null,
              selectedAddressType: '',
              selectedLatLng: null,
            ),
          );
          final result = await _addressCase.getStreetList();
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                  isFetchingStreet: false,
                ),
              );
            },
            (data) {
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  message: '',
                  isFetchingStreet: false,
                  streetList: data,
                ),
              );
            },
          );
        },
        onMapCreated: (event) async {
          if (event.latLng.latitude == 0) {
            emit(
              state.copyWith(
                isMapLoading: true,
                message: '',
              ),
            );
            final result = await _addressCase.getCurrentPosition();
            await result.fold(
              (f) {
                emit(
                  state.copyWith(
                    isMapLoading: false,
                    message: f.message,
                  ),
                );
              },
              (data) async {
                emit(state.copyWith(isMapLoading: true));
                await event.controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        data.latitude,
                        data.longitude,
                      ),
                      zoom: 18,
                    ),
                  ),
                );
                add(SignupFormEvent.updateMarker(data));
                emit(state.copyWith(isMapLoading: false));
              },
            );
          } else {
            final position = Position(
              altitudeAccuracy: 15,
              headingAccuracy: 15,
              longitude: event.latLng.longitude,
              latitude: event.latLng.latitude,
              timestamp: DateTime.now(),
              accuracy: 10,
              altitude: 10,
              heading: 0,
              speed: 0,
              speedAccuracy: 0,
            );
            emit(state.copyWith(isMapLoading: true));
            await event.controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: state.selectedLatLng != null
                      ? LatLng(
                          state.selectedLatLng!.latitude,
                          state.selectedLatLng!.longitude,
                        )
                      : LatLng(
                          event.latLng.latitude,
                          event.latLng.longitude,
                        ),
                  zoom: 18,
                ),
              ),
            );
            add(SignupFormEvent.updateMarker(position));
            emit(state.copyWith(isMapLoading: false));
          }
        },
        onMapTapped: (event) async {
          final position = Position(
            altitudeAccuracy: 15,
            headingAccuracy: 15,
            longitude: event.latLng.longitude,
            latitude: event.latLng.latitude,
            timestamp: DateTime.now(),
            accuracy: 10,
            altitude: 10,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
          );
          await event.controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                  event.latLng.latitude,
                  event.latLng.longitude,
                ),
                zoom: 18,
              ),
            ),
          );
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              initialLatLng: LatLng(
                position.latitude,
                position.longitude,
              ),
              selectedLatLng: event.latLng,
            ),
          );
          add(SignupFormEvent.updateMarker(position));
        },
        selectedAddressType: (event) {
          emit(
            state.copyWith(
              selectedAddressType: event.v,
              message: '',
              state: RequestState.empty,
            ),
          );
        },
        selectStreet: (event) {
          emit(
            state.copyWith(
              selectedStreet: event.v,
              message: '',
              state: RequestState.empty,
            ),
          );
        },
        updateMarker: (event) {
          emit(
            state.copyWith(
              state: RequestState.empty,
              message: '',
              selectedLatLng: LatLng(
                event.position.latitude,
                event.position.longitude,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('Current Position'),
                  position: LatLng(
                    event.position.latitude,
                    event.position.longitude,
                  ),
                ),
              },
            ),
          );
        },
        name: (event) {
          emit(
            state.copyWith(
              name: event.v,
              message: '',
              state: RequestState.empty,
              isFetchingStreet: false,
              isMapLoading: false,
              isSubmit: false,
            ),
          );
        },
        phone: (event) {
          emit(
            state.copyWith(
              phone: event.v,
              message: '',
              state: RequestState.empty,
              isFetchingStreet: false,
              isMapLoading: false,
              isSubmit: false,
            ),
          );
        },
        send: (_) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              message: '',
              isSubmit: true,
            ),
          );
          final result = await _userCase.register(
            streetId: state.selectedStreet!.id,
            name: state.name,
            phone: state.phone,
            address: state.address,
            type: state.selectedAddressType,
            latitude: state.markers.first.position.latitude,
            longitude: state.markers.first.position.longitude,
          );
          result.fold(
            (f) {
              emit(
                state.copyWith(
                  state: RequestState.error,
                  message: f.message,
                  isSubmit: false,
                ),
              );
            },
            (_) {
              emit(
                state.copyWith(
                  state: RequestState.loaded,
                  isSubmit: false,
                ),
              );
            },
          );
        },
      );
    });
  }
  final AddressUsecase _addressCase;
  final UserUsecase _userCase;
}
