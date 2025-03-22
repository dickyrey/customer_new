import 'package:reseller_submission_feature/bloc/submission_cancel_actor/submission_cancel_actor_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_detail_watcher/submission_detail_watcher_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_form/submission_form_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_watcher/submission_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class SubmissionFeatureInjection {
  SubmissionFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => SubmissionCancelActorBloc(
          locator(),
        ),
      )
      ..registerLazySingleton(
        () => SubmissionDetailWatcherBloc(
          locator(),
        ),
      )
      ..registerLazySingleton(
        () => SubmissionFormBloc(
          locator(),
          locator(),
        ),
      )
      ..registerLazySingleton(
        () => SubmissionWatcherBloc(locator()),
      );
  }
}
