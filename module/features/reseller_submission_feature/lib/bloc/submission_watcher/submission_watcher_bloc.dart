import 'package:reseller_core/domain/entities/submission.dart';
import 'package:reseller_core/domain/usecases/reseller_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'submission_watcher_event.dart';
part 'submission_watcher_state.dart';
part 'submission_watcher_bloc.freezed.dart';

class SubmissionWatcherBloc
    extends Bloc<SubmissionWatcherEvent, SubmissionWatcherState> {
  SubmissionWatcherBloc(this._usecase)
      : super(const SubmissionWatcherState.initial()) {
    on<SubmissionWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          page = 1;
          localList.clear();
          emit(const SubmissionWatcherState.loading());
          final result = await _usecase.getSubmissionList(page);
          result.fold(
            (f) => emit(SubmissionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        refresh: (event) async {
          page = 1;
          localList.clear();
          final result = await _usecase.getSubmissionList(page);
          result.fold(
            (f) => emit(SubmissionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        next: (_) async {
          page += 1;
          final result = await _usecase.getSubmissionList(page);
          result.fold(
            (f) => emit(SubmissionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
      );
    });
  }

  void _savingDataToLocal(
    List<Submission> data,
    Emitter<SubmissionWatcherState> emit,
  ) {
    final list = List.of(localList)..addAll(data);
    localList.addAll(data);
    if (data.length < 10) {
      emit(
        SubmissionWatcherState.loaded(
          hasReachedMax: true,
          submissionList: list,
        ),
      );
    } else {
      emit(
        SubmissionWatcherState.loaded(
          hasReachedMax: false,
          submissionList: list,
        ),
      );
    }
  }

  int page = 1;
  final localList = <Submission>[];
  final ResellerUsecase _usecase;
}
