import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'review_form_event.dart';
part 'review_form_state.dart';
part 'review_form_bloc.freezed.dart';

class ReviewFormBloc extends Bloc<ReviewFormEvent, ReviewFormState> {
  ReviewFormBloc(this._usecase) : super(ReviewFormState.initial()) {
    on<ReviewFormEvent>((event, emit) async {
      await event.map(
        starsOnChanged: (event) {
          emit(
            state.copyWith(
              isSubmit: false,
              message: '',
              state: RequestState.empty,
              value: event.v,
            ),
          );
        },
        reviewOnChanged: (event) {
          emit(
            state.copyWith(
              isSubmit: false,
              message: '',
              state: RequestState.empty,
              review: event.v,
            ),
          );
        },
        send: (event) async {
          emit(
            state.copyWith(
              isSubmit: true,
              message: '',
              state: RequestState.loading,
            ),
          );
          final result = await _usecase.reviewTransaction(
            id: event.orderId,
            rating: state.value.toInt(),
            review: state.review,
          );
          result.fold(
            (f) => emit(
              state.copyWith(
                isSubmit: false,
                message: f.message,
                state: RequestState.error,
              ),
            ),
            (_) => emit(
              state.copyWith(
                isSubmit: false,
                message: '',
                state: RequestState.loaded,
              ),
            ),
          );
        },
      );
    });
  }
  final TransactionUsecase _usecase;
}
