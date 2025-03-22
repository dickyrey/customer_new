import 'dart:io';

import 'package:address_core/data/models/address_detail_model.dart';
import 'package:address_core/data/models/address_model.dart';
import 'package:address_core/data/models/street_model.dart';
import 'package:address_core/data/repositories/address_repository_impl.dart';
import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/entities/address_detail.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';

import '../../tools/helper/test_helper.mocks.dart';

void main() {
  late AddressRepositoryImpl repository;
  late MockAddressDataSource dataSource;

  setUp(() {
    dataSource = MockAddressDataSource();
    repository = AddressRepositoryImpl(
      dataSource,
    );
  });

  const tModel = AddressModel(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    street: StreetModel(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  const tEntity = Address(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    street: Street(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );
  const tAddressDetailModel = AddressDetailModel(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    latitude: -1.6819289,
    longitude: 109.2648223,
    street: AddressDetailStreetModel(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  const tAddressDetailEntity = AddressDetail(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    latitude: -1.6819289,
    longitude: 109.2648223,
    street: AddressDetailStreet(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  const tStreetModel = StreetModel(
    id: 6,
    street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
  );

  const tStreetEntity = Street(
    id: 6,
    street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
  );

  final tAddressModelList = <AddressModel>[tModel];
  final tAddressList = <Address>[tEntity];
  final tStreetModelList = <StreetModel>[tStreetModel];
  final tStreetList = <Street>[tStreetEntity];

  group('Create Address', () {
    const tStreetId = 1;
    const tName = 'John Doe';
    const tPhone = '08123456789';
    const tAddress = '123 Main Street';
    const tType = 'Home';
    const tLatitude = 1.2345;
    const tLongitude = 2.3456;

    test('Call to remote data source is successful', () async {
      // arrange
      when(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenAnswer((_) async => true);

      // act
      final result = await repository.createAddress(
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(result, equals(const Right<Failure, bool>(true)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenThrow(ServerException('Server error'));

      // act
      final result = await repository.createAddress(
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ServerFailure('Server error'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.createAddress(
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.createAddress(
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Delete Address', () {
    const tAddressId = 1;

    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.deleteAddress(tAddressId)).thenAnswer((_) async => true);

      // act
      final result = await repository.deleteAddress(tAddressId);

      // assert
      verify(dataSource.deleteAddress(tAddressId));
      expect(result, equals(const Right<Failure, bool>(true)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.deleteAddress(tAddressId))
          .thenThrow(ServerException('Server error'));

      // act
      final result = await repository.deleteAddress(tAddressId);

      // assert
      verify(dataSource.deleteAddress(tAddressId));
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ServerFailure('Server error'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.deleteAddress(tAddressId))
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.deleteAddress(tAddressId);

      // assert
      verify(dataSource.deleteAddress(tAddressId));
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Address List', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.getAddressList())
          .thenAnswer((_) async => tAddressModelList);

      // act
      final result = await repository.getAddressList();

      // assert
      verify(dataSource.getAddressList());
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tAddressList));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.getAddressList())
          .thenThrow(ServerException('Server error'));

      // act
      final result = await repository.getAddressList();

      // assert
      verify(dataSource.getAddressList());
      expect(
        result,
        equals(
          const Left<Failure, List<Address>>(
            ServerFailure('Server error'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.getAddressList())
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.getAddressList();

      // assert
      verify(dataSource.getAddressList());
      expect(
        result,
        equals(
          const Left<Failure, List<Address>>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Address Detail', () {
    const tAddressId = 1;

    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.getAddressDetail(tAddressId))
          .thenAnswer((_) async => tAddressDetailModel);

      // act
      final result = await repository.getAddressDetail(tAddressId);

      // assert
      verify(dataSource.getAddressDetail(tAddressId));
      expect(
        result,
        equals(
          const Right<Failure, AddressDetail>(tAddressDetailEntity),
        ),
      );
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.getAddressDetail(tAddressId))
          .thenThrow(ServerException('Server error'));

      // act
      final result = await repository.getAddressDetail(tAddressId);

      // assert
      verify(dataSource.getAddressDetail(tAddressId));
      expect(
        result,
        equals(
          const Left<Failure, AddressDetail>(
            ServerFailure('Server error'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.getAddressDetail(tAddressId))
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.getAddressDetail(tAddressId);

      // assert
      verify(dataSource.getAddressDetail(tAddressId));
      expect(
        result,
        equals(
          const Left<Failure, AddressDetail>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Current Position', () {
    final tPosition = Position(
      latitude: -6.200000,
      longitude: 106.816666,
      timestamp: DateTime.now(),
      accuracy: 5,
      altitude: 10,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 15,
      headingAccuracy: 15,
    );

    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.getCurrentPosition()).thenAnswer((_) async => tPosition);

      // act
      final result = await repository.getCurrentPosition();

      // assert
      verify(dataSource.getCurrentPosition());
      expect(result, equals(Right<Failure, Position>(tPosition)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.getCurrentPosition())
          .thenThrow(ServerException('Failed to get location'));

      // act
      final result = await repository.getCurrentPosition();

      // assert
      verify(dataSource.getCurrentPosition());
      expect(
        result,
        equals(
          const Left<Failure, Position>(
            ServerFailure('Failed to get location'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.getCurrentPosition())
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.getCurrentPosition();

      // assert
      verify(dataSource.getCurrentPosition());
      expect(
        result,
        equals(
          const Left<Failure, Position>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Street List', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.getStreetList())
          .thenAnswer((_) async => tStreetModelList);

      // act
      final result = await repository.getStreetList();

      // assert
      verify(
        dataSource.getStreetList(),
      );
      final resultList = result.getOrElse(() => []);
      expect(resultList, tStreetList);
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.getStreetList())
          .thenThrow(ServerException('Failed to load streets'));

      // act
      final result = await repository.getStreetList();

      // assert
      verify(dataSource.getStreetList());
      expect(
        result,
        equals(
          const Left<Failure, List<Street>>(
            ServerFailure('Failed to load streets'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.getStreetList())
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.getStreetList();

      // assert
      verify(dataSource.getStreetList());
      expect(
        result,
        equals(
          const Left<Failure, List<Street>>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Set Default Address', () {
    const tId = 1;

    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.setDefault(tId)).thenAnswer((_) async => true);

      // act
      final result = await repository.setDefault(tId);

      // assert
      verify(dataSource.setDefault(tId));
      expect(result, equals(const Right<Failure, bool>(true)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.setDefault(tId))
          .thenThrow(ServerException('Failed to set default address'));

      // act
      final result = await repository.setDefault(tId);

      // assert
      verify(dataSource.setDefault(tId));
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ServerFailure('Failed to set default address'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.setDefault(tId))
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.setDefault(tId);

      // assert
      verify(dataSource.setDefault(tId));
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Update Address', () {
    const tId = 1;
    const tStreetId = 101;
    const tName = 'John Doe';
    const tPhone = '08123456789';
    const tAddress = 'Jl. Merdeka No.1';
    const tType = 'Home';
    const tLatitude = -6.200000;
    const tLongitude = 106.816666;

    test('Call to remote data source is successful', () async {
      // arrange
      when(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenAnswer((_) async => true);

      // act
      final result = await repository.updateAddress(
        id: tId,
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(result, equals(const Right<Failure, bool>(true)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenThrow(ServerException('Failed to update address'));

      // act
      final result = await repository.updateAddress(
        id: tId,
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ServerFailure('Failed to update address'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      ).thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.updateAddress(
        id: tId,
        streetId: tStreetId,
        name: tName,
        phone: tPhone,
        address: tAddress,
        type: tType,
        latitude: tLatitude,
        longitude: tLongitude,
      );

      // assert
      verify(
        dataSource.updateAddress(
          id: tId,
          streetId: tStreetId,
          name: tName,
          phone: tPhone,
          address: tAddress,
          type: tType,
          latitude: tLatitude,
          longitude: tLongitude,
        ),
      );
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
}
