import 'package:deposit_core/data/models/deposit_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class DepositResponse extends Equatable {
  const DepositResponse({
    required this.depositList,
  });

  factory DepositResponse.fromJson(Map<String, dynamic> json) {
    return DepositResponse(
      depositList: List<DepositModel>.from(
        (json['data'] as List)
            .map((e) => DepositModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<DepositModel> depositList;

  @override
  List<Object?> get props => [depositList];
}
