import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/entities/address_detail.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';

abstract class AddressRepository {
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
