import 'package:reseller_core/domain/entities/submission_detail.dart';
import 'package:reseller_core/domain/usecases/reseller_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'submission_detail_watcher_event.dart';
part 'submission_detail_watcher_state.dart';
part 'submission_detail_watcher_bloc.freezed.dart';

class SubmissionDetailWatcherBloc
    extends Bloc<SubmissionDetailWatcherEvent, SubmissionDetailWatcherState> {
  SubmissionDetailWatcherBloc(this._usecase)
      : super(const SubmissionDetailWatcherState.initial()) {
    on<SubmissionDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const SubmissionDetailWatcherState.loading());
          final result = await _usecase.getSubmissionDetail(event.id);
          result.fold(
            (f) => emit(SubmissionDetailWatcherState.failed(f.message)),
            (data) => emit(SubmissionDetailWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final ResellerUsecase _usecase;
}
