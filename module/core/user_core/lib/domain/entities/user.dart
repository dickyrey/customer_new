import 'package:shared_libraries/equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.cash,
    required this.point,
    required this.lastLogin,
    required this.lastIp,
    required this.userAgent,
    required this.isRegistered,
    required this.isReseller,
    required this.address,
    required this.sales,
    // required this.createdAt,
    // required this.updatedAt,
  });

  final int id;
  final String name;
  final String phone;
  final int cash;
  final int point;
  final DateTime lastLogin;
  final String lastIp;
  final String userAgent;
  final bool isRegistered;
  final bool isReseller;
  final UserAddress address;
  final UserSales sales;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name, phone,
        cash,
        point,
        lastLogin,
        lastIp,
        userAgent,
        isRegistered,
        isReseller,
        address,
        sales,
        // createdAt,
        // updatedAt,
      ];
}

class UserAddress extends Equatable {
  const UserAddress({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.street,
  });

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final double latitude;
  final double longitude;
  final UserAddressStreet street;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        type,
        latitude,
        longitude,
        street,
      ];
}

class UserAddressStreet extends Equatable {
  const UserAddressStreet({
    required this.id,
    required this.street,
  });

  final int id;
  final String street;

  @override
  List<Object?> get props => [];
}

class UserSales extends Equatable {
  const UserSales({
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
