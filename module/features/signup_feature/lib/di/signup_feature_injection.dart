import 'package:shared_libraries/get_it/get_it.dart';
import 'package:signup_feature/bloc/signup_form/signup_form_bloc.dart';

class SignupFeatureInjection {
  SignupFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => SignupFormBloc(
        locator(),
        locator(),
      ),
    );
  }
}
