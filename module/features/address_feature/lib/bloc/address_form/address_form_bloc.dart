import 'package:address_core/domain/entities/street.dart';
import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';

part 'address_form_event.dart';
part 'address_form_state.dart';
part 'address_form_bloc.freezed.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc(this._usecase) : super(AddressFormState.initial()) {
    on<AddressFormEvent>((event, emit) async {
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
        fetchAddress: (event) async {
          add(AddressFormEvent.phone(event.args.phone));
          emit(
            state.copyWith(
              state: RequestState.empty,
              isFetchingStreet: true,
              message: '',
              name: event.args.name,
              selectedStreet: null,
              selectedAddressType: event.args.type,
              selectedLatLng: null,
            ),
          );
          final result = await _usecase.getAddressDetail(event.args.id);
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
                  initialLatLng: LatLng(data.latitude, data.longitude),
                  selectedLatLng: LatLng(data.latitude, data.longitude),
                  address: data.address,
                  // selectedStreet: find.first,
                ),
              );
              add(AddressFormEvent.fetchStreet(data.street.street));
            },
          );
        },
        fetchStreet: (event) async {
          if (event.street == '') {
            emit(
              state.copyWith(
                state: RequestState.loading,
                isFetchingStreet: true,
                selectedStreet: null,
              ),
            );
          }
          final result = await _usecase.getStreetList();
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
              final find = data
                  .where(
                    (street) => street.street == event.street,
                  )
                  .toList();
              emit(
                state.copyWith(
                  state: RequestState.empty,
                  message: '',
                  isFetchingStreet: false,
                  streetList: data,
                  selectedStreet: event.street == '' ? null : find.first,
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
            final result = await _usecase.getCurrentPosition();
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
                add(AddressFormEvent.updateMarker(data));
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
            add(AddressFormEvent.updateMarker(position));
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
          add(AddressFormEvent.updateMarker(position));
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
          var digits = event.v.replaceAll(RegExp(r'[^\d]'), '');

          if (digits.startsWith('0')) {
            digits = '62${digits.substring(1)}';
          } else if (event.v.startsWith('8')) {
            digits = '628${digits.substring(1)}';
          }

          final result = digits;
          emit(
            state.copyWith(
              phone: event.v,
              formattedPhoneNumber: result,
              message: '',
              state: RequestState.empty,
              isFetchingStreet: false,
              isMapLoading: false,
              isSubmit: false,
            ),
          );
        },
        create: (_) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              message: '',
              isSubmit: true,
            ),
          );
          final result = await _usecase.createAddress(
            streetId: state.selectedStreet!.id,
            name: state.name,
            phone: state.formattedPhoneNumber,
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
        update: (event) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              message: '',
              isSubmit: true,
            ),
          );
          final result = await _usecase.updateAddress(
            id: event.id,
            streetId: state.selectedStreet!.id,
            name: state.name,
            phone: state.formattedPhoneNumber,
            address: state.address,
            type: state.selectedAddressType,
            latitude: state.selectedLatLng!.latitude,
            longitude: state.selectedLatLng!.longitude,
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
  final AddressUsecase _usecase;
}
