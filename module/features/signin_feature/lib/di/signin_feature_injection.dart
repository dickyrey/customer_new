import 'package:shared_libraries/get_it/get_it.dart';
import 'package:signin_feature/bloc/signin_form/signin_form_bloc.dart';

class SigninFeatureInjection {
  SigninFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => SigninFormBloc(locator()),
    );
  }
}
