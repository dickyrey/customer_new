import 'package:shared_libraries/equatable/equatable.dart';

class Sales extends Equatable {
  const Sales({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  final int id;
  final String name;
  final String image;
  final int rating;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        rating,
      ];
}
