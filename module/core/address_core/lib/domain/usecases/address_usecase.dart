import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/entities/address_detail.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:address_core/domain/repositories/address_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';

abstract class AddressUsecase {
  Future<Either<Failure, bool>> createAddress({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  });
  Future<Either<Failure, bool>> deleteAddress(int id);
  Future<Either<Failure, List<Address>>> getAddressList();
  Future<Either<Failure, AddressDetail>> getAddressDetail(int id);
  Future<Either<Failure, Position>> getCurrentPosition();
  Future<Either<Failure, List<Street>>> getStreetList();
  Future<Either<Failure, bool>> setDefault(int id);
  Future<Either<Failure, bool>> updateAddress({
    required int id,
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  });
}

class AddressUsecaseImpl extends AddressUsecase {
  AddressUsecaseImpl(this.repository);

  final AddressRepository repository;

  @override
  Future<Either<Failure, bool>> createAddress({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  }) {
    return repository.createAddress(
      streetId: streetId,
      name: name,
      phone: phone,
      address: address,
      type: type,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Future<Either<Failure, bool>> deleteAddress(int id) {
    return repository.deleteAddress(id);
  }

  @override
  Future<Either<Failure, List<Address>>> getAddressList() {
    return repository.getAddressList();
  }

  @override
  Future<Either<Failure, AddressDetail>> getAddressDetail(int id) {
    return repository.getAddressDetail(id);
  }

  @override
  Future<Either<Failure, Position>> getCurrentPosition() {
    return repository.getCurrentPosition();
  }

  @override
  Future<Either<Failure, List<Street>>> getStreetList() {
    return repository.getStreetList();
  }

  @override
  Future<Either<Failure, bool>> setDefault(int id) {
    return repository.setDefault(id);
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
  }) {
    return repository.updateAddress(
      id: id,
      streetId: streetId,
      name: name,
      phone: phone,
      address: address,
      type: type,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
