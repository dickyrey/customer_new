import 'package:review_feature/bloc/review_form/review_form_bloc.dart';
import 'package:review_feature/bloc/review_transaction_watcher/review_transaction_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class ReviewFeatureInjection {
  ReviewFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => ReviewFormBloc(locator()),
      )
      ..registerLazySingleton(
        () => ReviewTransactionWatcherBloc(locator()),
      );
  }
}
