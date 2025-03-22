import 'package:reseller_core/domain/usecases/reseller_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'submission_cancel_actor_event.dart';
part 'submission_cancel_actor_state.dart';
part 'submission_cancel_actor_bloc.freezed.dart';

class SubmissionCancelActorBloc
    extends Bloc<SubmissionCancelActorEvent, SubmissionCancelActorState> {
  SubmissionCancelActorBloc(this._usecase)
      : super(const SubmissionCancelActorState.initial()) {
    on<SubmissionCancelActorEvent>((event, emit) async {
      await event.map(
        cancel: (event) async {
          emit(const SubmissionCancelActorState.loading());
          final result = await _usecase.cancelSubmission(event.id);
          result.fold(
            (f) {
              emit(SubmissionCancelActorState.failed(f.message));
            },
            (data) {
              emit(const SubmissionCancelActorState.loaded());
            },
          );
        },
      );
    });
  }
  final ResellerUsecase _usecase;
}
