import 'package:checkout_feature/bloc/checkout_form/checkout_form_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class CheckoutFeatureInjection {
  CheckoutFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => CheckoutFormBloc(
        locator(),
        locator(),
      ),
    );
  }
}
