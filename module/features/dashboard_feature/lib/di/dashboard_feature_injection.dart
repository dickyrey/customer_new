import 'package:dashboard_feature/bloc/order_counter_form/order_counter_form_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class DashboardFeatureInjection {
  DashboardFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => OrderCounterFormBloc(locator()),
    );
  }
}
