import 'package:change_number_feature/bloc/change_number_form/change_number_form_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class ChangeNumberFeatureInjection {
  ChangeNumberFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => ChangeNumberFormBloc(
        locator(),
      ),
    );
  }
}
