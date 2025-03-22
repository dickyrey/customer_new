import 'package:shared_libraries/equatable/equatable.dart';

class Street extends Equatable {
  const Street({
    required this.id,
    required this.street,
  });

  final int id;
  final String street;

  @override
  List<Object?> get props => [
        id,
        street,
      ];
}
