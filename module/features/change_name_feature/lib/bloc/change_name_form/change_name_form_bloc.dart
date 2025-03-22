import 'package:sales_core/domain/entities/sales.dart';
import 'package:sales_core/domain/usecases/sales_usecase.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:user_core/domain/entities/user.dart';
import 'package:user_core/domain/usecases/user_usecase.dart';

part 'change_name_form_bloc.freezed.dart';
part 'change_name_form_event.dart';
part 'change_name_form_state.dart';

class ChangeNameFormBloc
    extends Bloc<ChangeNameFormEvent, ChangeNameFormState> {
  ChangeNameFormBloc(
    this._userCase,
    this._salesCase,
  ) : super(ChangeNameFormState.initial()) {
    on<ChangeNameFormEvent>(
      (event, emit) async {
        await event.map(
          fullName: (event) {
            emit(
              state.copyWith(
                fullName: event.val,
                message: '',
                state: RequestState.empty,
              ),
            );
          },
          save: (_) async {
            emit(
              state.copyWith(
                message: '',
                state: RequestState.loading,
                isSubmit: true,
              ),
            );
            final result = await _userCase.profile(
              fullName: state.fullName,
              salesId:
                  state.selectedSales == null ? 0 : state.selectedSales!.id,
            );
            result.fold(
              (f) {
                emit(
                  state.copyWith(
                    state: RequestState.error,
                    message: f.message,
                    isSubmit: false,
                  ),
                );
              },
              (_) {
                emit(
                  state.copyWith(
                    state: RequestState.loaded,
                    isSubmit: false,
                  ),
                );
              },
            );
          },
          fetchSales: (event) async {
            emit(
              state.copyWith(
                state: RequestState.loading,
                isFetchingSales: true,
                selectedSales: event.user.sales.id == 0
                    ? null
                    : Sales(
                        id: event.user.sales.id,
                        name: event.user.sales.name,
                        image: event.user.sales.image,
                        rating: event.user.sales.rating,
                      ),
                fullName: event.user.name,
              ),
            );
            final result = await _salesCase.getSalesList();
            result.fold(
              (f) {
                emit(
                  state.copyWith(
                    state: RequestState.error,
                    message: f.message,
                    isFetchingSales: false,
                  ),
                );
              },
              (data) {
                final find = data
                    .where(
                      (sales) => sales.name == event.user.sales.name,
                    )
                    .toList();
                emit(
                  state.copyWith(
                    state: RequestState.empty,
                    message: '',
                    isFetchingSales: false,
                    salesList: data,
                    selectedSales: find.isNotEmpty ? find.first : null,
                  ),
                );
              },
            );
          },
          selectSales: (event) {
            emit(
              state.copyWith(
                selectedSales: event.v,
                message: '',
                state: RequestState.empty,
              ),
            );
          },
        );
      },
    );
  }
  final UserUsecase _userCase;
  final SalesUsecase _salesCase;
}
