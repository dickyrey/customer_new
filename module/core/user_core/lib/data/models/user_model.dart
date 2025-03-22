import 'package:shared_libraries/equatable/equatable.dart';
import 'package:user_core/domain/entities/user.dart';

class UserModel extends Equatable {
  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final isRegistered = json['is_registered'] == '1';
    final isReseller = json['is_reseller'] == '1';

    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      cash: json['cash'] as int,
      point: json['point'] as int,
      lastLogin: DateTime.parse(json['last_login'] as String),
      lastIp: json['last_ip'] as String,
      userAgent: json['user_agent'] as String,
      isRegistered: isRegistered,
      isReseller: isReseller,
      address: UserAddressModel.fromJson(
        json['address'] as Map<String, dynamic>,
      ),
      sales: UserSalesModel.fromJson(
        json['sales'] as Map<String, dynamic>,
      ),
      // createdAt: DateTime.parse(json['created_at'] as String),
      // updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      phone: phone,
      cash: cash,
      point: point,
      lastLogin: lastLogin,
      lastIp: lastIp,
      userAgent: userAgent,
      isRegistered: isRegistered,
      isReseller: isReseller,
      address: address.toEntity(),
      sales: sales.toEntity(),
      // createdAt: createdAt,
      // updatedAt: updatedAt,
    );
  }

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
  final UserAddressModel address;
  final UserSalesModel sales;
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

class UserAddressModel extends Equatable {
  const UserAddressModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.street,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    final latitude = json['latitude'] == 0 ? 0.0 : json['latitude'];
    final longitude = json['longitude'] == 0 ? 0.0 : json['longitude'];
    return UserAddressModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      latitude: latitude as double,
      longitude: longitude as double,
      street: UserAddressStreetModel.fromJson(
        json['street'] as Map<String, dynamic>,
      ),
    );
  }

  UserAddress toEntity() {
    return UserAddress(
      id: id,
      name: name,
      phone: phone,
      address: address,
      type: type,
      latitude: latitude,
      longitude: longitude,
      street: street.toEntity(),
    );
  }

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final double latitude;
  final double longitude;
  final UserAddressStreetModel street;

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

class UserAddressStreetModel extends Equatable {
  const UserAddressStreetModel({
    required this.id,
    required this.street,
  });

  factory UserAddressStreetModel.fromJson(Map<String, dynamic> json) =>
      UserAddressStreetModel(
        id: json['id'] as int,
        street: json['street'] as String,
      );

  UserAddressStreet toEntity() {
    return UserAddressStreet(
      id: id,
      street: street,
    );
  }

  final int id;
  final String street;

  @override
  List<Object?> get props => [];
}

class UserSalesModel extends Equatable {
  const UserSalesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  factory UserSalesModel.fromJson(Map<String, dynamic> json) => UserSalesModel(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        rating: json['rating'] as int,
      );

  UserSales toEntity() {
    return UserSales(
      id: id,
      name: name,
      image: image,
      rating: rating,
    );
  }

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
