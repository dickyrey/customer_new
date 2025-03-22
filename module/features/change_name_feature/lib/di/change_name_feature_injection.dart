import 'package:change_name_feature/bloc/change_name_form/change_name_form_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class ChangeNameFeatureInjection {
  ChangeNameFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => ChangeNameFormBloc(
        locator(),
        locator(),
      ),
    );
  }
}
