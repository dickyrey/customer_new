import 'package:flutter/material.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:signup_feature/bloc/signup_form/signup_form_bloc.dart';

class SignupGoogleMapBodyWidget extends StatelessWidget {
  const SignupGoogleMapBodyWidget({
    required this.controller,
    required this.args,
    super.key,
  });

  final ValueNotifier<GoogleMapController?> controller;
  final AddressArgument args;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupFormBloc, SignupFormState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (v) {
                      controller.value = v;
                      context.read<SignupFormBloc>().add(
                            SignupFormEvent.onMapCreated(
                              controller: v,
                              latLng: state.selectedLatLng != null
                                  ? LatLng(
                                      state.selectedLatLng!.latitude,
                                      state.selectedLatLng!.longitude,
                                    )
                                  : const LatLng(0, 0),
                            ),
                          );
                    },
                    initialCameraPosition: CameraPosition(
                      target: state.selectedLatLng != null
                          ? LatLng(
                              state.selectedLatLng!.latitude,
                              state.selectedLatLng!.longitude,
                            )
                          : const LatLng(-1.839072, 109.974702),
                      zoom: 15,
                    ),
                    markers: state.markers,
                    mapType: MapType.satellite,
                    onTap: (value) {
                      context.read<SignupFormBloc>().add(
                            SignupFormEvent.onMapTapped(
                              controller: controller.value!,
                              latLng: value,
                            ),
                          );
                    },
                  ),
                  if (!state.isMapLoading)
                    const SizedBox()
                  else
                    const Positioned.fill(
                      child: ColoredBox(
                        color: Colors.black38,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              label: 'Pilih Lokasi Ini',
              margin: const EdgeInsets.all(MARGIN),
            ),
          ],
        );
      },
    );
  }
}
