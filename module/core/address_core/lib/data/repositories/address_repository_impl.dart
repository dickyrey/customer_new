import 'dart:io';

import 'package:address_core/data/data_sources/address_data_source.dart';
import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/entities/address_detail.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:address_core/domain/repositories/address_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';

class AddressRepositoryImpl extends AddressRepository {
  AddressRepositoryImpl(this.dataSource);

  final AddressDataSource dataSource;

  @override
  Future<Either<Failure, bool>> createAddress({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final result = await dataSource.createAddress(
        streetId: streetId,
        name: name,
        phone: phone,
        address: address,
        type: type,
        latitude: latitude,
        longitude: longitude,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAddress(int id) async {
    try {
      final result = await dataSource.deleteAddress(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddressList() async {
    try {
      final result = await dataSource.getAddressList();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, AddressDetail>> getAddressDetail(int id) async {
    try {
      final result = await dataSource.getAddressDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      final result = await dataSource.getCurrentPosition();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, List<Street>>> getStreetList() async {
    try {
      final result = await dataSource.getStreetList();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setDefault(int id) async {
    try {
      final result = await dataSource.setDefault(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateAddress({
    required int id,
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final result = await dataSource.updateAddress(
        id: id,
        streetId: streetId,
        name: name,
        phone: phone,
        address: address,
        type: type,
        latitude: latitude,
        longitude: longitude,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
