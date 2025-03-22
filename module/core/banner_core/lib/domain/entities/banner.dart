import 'package:shared_libraries/equatable/equatable.dart';

class Banner extends Equatable {
  const Banner({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  @override
  List<Object?> get props => [
        id,
        image,
      ];
}
