import 'package:deposit_core/data/models/deposit_detail_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class DepositDetailResponse extends Equatable {
  const DepositDetailResponse({
    required this.deposit,
  });

  factory DepositDetailResponse.fromJson(Map<String, dynamic> json) {
    return DepositDetailResponse(
      deposit: DepositDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final DepositDetailModel deposit;

  @override
  List<Object?> get props => [deposit];
}
