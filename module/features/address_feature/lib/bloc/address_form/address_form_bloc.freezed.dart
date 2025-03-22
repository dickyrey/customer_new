// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFormEventCopyWith<$Res> {
  factory $AddressFormEventCopyWith(
          AddressFormEvent value, $Res Function(AddressFormEvent) then) =
      _$AddressFormEventCopyWithImpl<$Res, AddressFormEvent>;
}

/// @nodoc
class _$AddressFormEventCopyWithImpl<$Res, $Val extends AddressFormEvent>
    implements $AddressFormEventCopyWith<$Res> {
  _$AddressFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$AddressImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressImpl implements _Address {
  const _$AddressImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'AddressFormEvent.address(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return address(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return address?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (address != null) {
      return address(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return address(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return address?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (address != null) {
      return address(this);
    }
    return orElse();
  }
}

abstract class _Address implements AddressFormEvent {
  const factory _Address(final String v) = _$AddressImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAddressImplCopyWith<$Res> {
  factory _$$FetchAddressImplCopyWith(
          _$FetchAddressImpl value, $Res Function(_$FetchAddressImpl) then) =
      __$$FetchAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressArgument args});
}

/// @nodoc
class __$$FetchAddressImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$FetchAddressImpl>
    implements _$$FetchAddressImplCopyWith<$Res> {
  __$$FetchAddressImplCopyWithImpl(
      _$FetchAddressImpl _value, $Res Function(_$FetchAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? args = null,
  }) {
    return _then(_$FetchAddressImpl(
      null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as AddressArgument,
    ));
  }
}

/// @nodoc

class _$FetchAddressImpl implements _FetchAddress {
  const _$FetchAddressImpl(this.args);

  @override
  final AddressArgument args;

  @override
  String toString() {
    return 'AddressFormEvent.fetchAddress(args: $args)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAddressImpl &&
            (identical(other.args, args) || other.args == args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, args);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAddressImplCopyWith<_$FetchAddressImpl> get copyWith =>
      __$$FetchAddressImplCopyWithImpl<_$FetchAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return fetchAddress(args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return fetchAddress?.call(args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress(args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return fetchAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return fetchAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress(this);
    }
    return orElse();
  }
}

abstract class _FetchAddress implements AddressFormEvent {
  const factory _FetchAddress(final AddressArgument args) = _$FetchAddressImpl;

  AddressArgument get args;
  @JsonKey(ignore: true)
  _$$FetchAddressImplCopyWith<_$FetchAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchStreetImplCopyWith<$Res> {
  factory _$$FetchStreetImplCopyWith(
          _$FetchStreetImpl value, $Res Function(_$FetchStreetImpl) then) =
      __$$FetchStreetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String street});
}

/// @nodoc
class __$$FetchStreetImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$FetchStreetImpl>
    implements _$$FetchStreetImplCopyWith<$Res> {
  __$$FetchStreetImplCopyWithImpl(
      _$FetchStreetImpl _value, $Res Function(_$FetchStreetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
  }) {
    return _then(_$FetchStreetImpl(
      null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchStreetImpl implements _FetchStreet {
  const _$FetchStreetImpl(this.street);

  @override
  final String street;

  @override
  String toString() {
    return 'AddressFormEvent.fetchStreet(street: $street)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStreetImpl &&
            (identical(other.street, street) || other.street == street));
  }

  @override
  int get hashCode => Object.hash(runtimeType, street);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStreetImplCopyWith<_$FetchStreetImpl> get copyWith =>
      __$$FetchStreetImplCopyWithImpl<_$FetchStreetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return fetchStreet(street);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return fetchStreet?.call(street);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (fetchStreet != null) {
      return fetchStreet(street);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return fetchStreet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return fetchStreet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (fetchStreet != null) {
      return fetchStreet(this);
    }
    return orElse();
  }
}

abstract class _FetchStreet implements AddressFormEvent {
  const factory _FetchStreet(final String street) = _$FetchStreetImpl;

  String get street;
  @JsonKey(ignore: true)
  _$$FetchStreetImplCopyWith<_$FetchStreetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectStreetImplCopyWith<$Res> {
  factory _$$SelectStreetImplCopyWith(
          _$SelectStreetImpl value, $Res Function(_$SelectStreetImpl) then) =
      __$$SelectStreetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Street v});
}

/// @nodoc
class __$$SelectStreetImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$SelectStreetImpl>
    implements _$$SelectStreetImplCopyWith<$Res> {
  __$$SelectStreetImplCopyWithImpl(
      _$SelectStreetImpl _value, $Res Function(_$SelectStreetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$SelectStreetImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as Street,
    ));
  }
}

/// @nodoc

class _$SelectStreetImpl implements _SelectStreet {
  const _$SelectStreetImpl(this.v);

  @override
  final Street v;

  @override
  String toString() {
    return 'AddressFormEvent.selectStreet(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectStreetImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectStreetImplCopyWith<_$SelectStreetImpl> get copyWith =>
      __$$SelectStreetImplCopyWithImpl<_$SelectStreetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return selectStreet(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return selectStreet?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (selectStreet != null) {
      return selectStreet(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return selectStreet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return selectStreet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (selectStreet != null) {
      return selectStreet(this);
    }
    return orElse();
  }
}

abstract class _SelectStreet implements AddressFormEvent {
  const factory _SelectStreet(final Street v) = _$SelectStreetImpl;

  Street get v;
  @JsonKey(ignore: true)
  _$$SelectStreetImplCopyWith<_$SelectStreetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnMapCreatedImplCopyWith<$Res> {
  factory _$$OnMapCreatedImplCopyWith(
          _$OnMapCreatedImpl value, $Res Function(_$OnMapCreatedImpl) then) =
      __$$OnMapCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GoogleMapController controller, LatLng latLng});
}

/// @nodoc
class __$$OnMapCreatedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$OnMapCreatedImpl>
    implements _$$OnMapCreatedImplCopyWith<$Res> {
  __$$OnMapCreatedImplCopyWithImpl(
      _$OnMapCreatedImpl _value, $Res Function(_$OnMapCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? latLng = null,
  }) {
    return _then(_$OnMapCreatedImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$OnMapCreatedImpl implements _OnMapCreated {
  const _$OnMapCreatedImpl({required this.controller, required this.latLng});

  @override
  final GoogleMapController controller;
  @override
  final LatLng latLng;

  @override
  String toString() {
    return 'AddressFormEvent.onMapCreated(controller: $controller, latLng: $latLng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnMapCreatedImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnMapCreatedImplCopyWith<_$OnMapCreatedImpl> get copyWith =>
      __$$OnMapCreatedImplCopyWithImpl<_$OnMapCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return onMapCreated(controller, latLng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return onMapCreated?.call(controller, latLng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(controller, latLng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return onMapCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return onMapCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(this);
    }
    return orElse();
  }
}

abstract class _OnMapCreated implements AddressFormEvent {
  const factory _OnMapCreated(
      {required final GoogleMapController controller,
      required final LatLng latLng}) = _$OnMapCreatedImpl;

  GoogleMapController get controller;
  LatLng get latLng;
  @JsonKey(ignore: true)
  _$$OnMapCreatedImplCopyWith<_$OnMapCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnMapTappedImplCopyWith<$Res> {
  factory _$$OnMapTappedImplCopyWith(
          _$OnMapTappedImpl value, $Res Function(_$OnMapTappedImpl) then) =
      __$$OnMapTappedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GoogleMapController controller, LatLng latLng});
}

/// @nodoc
class __$$OnMapTappedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$OnMapTappedImpl>
    implements _$$OnMapTappedImplCopyWith<$Res> {
  __$$OnMapTappedImplCopyWithImpl(
      _$OnMapTappedImpl _value, $Res Function(_$OnMapTappedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? latLng = null,
  }) {
    return _then(_$OnMapTappedImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$OnMapTappedImpl implements _OnMapTapped {
  const _$OnMapTappedImpl({required this.controller, required this.latLng});

  @override
  final GoogleMapController controller;
  @override
  final LatLng latLng;

  @override
  String toString() {
    return 'AddressFormEvent.onMapTapped(controller: $controller, latLng: $latLng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnMapTappedImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnMapTappedImplCopyWith<_$OnMapTappedImpl> get copyWith =>
      __$$OnMapTappedImplCopyWithImpl<_$OnMapTappedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return onMapTapped(controller, latLng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return onMapTapped?.call(controller, latLng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (onMapTapped != null) {
      return onMapTapped(controller, latLng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return onMapTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return onMapTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (onMapTapped != null) {
      return onMapTapped(this);
    }
    return orElse();
  }
}

abstract class _OnMapTapped implements AddressFormEvent {
  const factory _OnMapTapped(
      {required final GoogleMapController controller,
      required final LatLng latLng}) = _$OnMapTappedImpl;

  GoogleMapController get controller;
  LatLng get latLng;
  @JsonKey(ignore: true)
  _$$OnMapTappedImplCopyWith<_$OnMapTappedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdataMarkerImplCopyWith<$Res> {
  factory _$$UpdataMarkerImplCopyWith(
          _$UpdataMarkerImpl value, $Res Function(_$UpdataMarkerImpl) then) =
      __$$UpdataMarkerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Position position});
}

/// @nodoc
class __$$UpdataMarkerImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$UpdataMarkerImpl>
    implements _$$UpdataMarkerImplCopyWith<$Res> {
  __$$UpdataMarkerImplCopyWithImpl(
      _$UpdataMarkerImpl _value, $Res Function(_$UpdataMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$UpdataMarkerImpl(
      null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$UpdataMarkerImpl implements _UpdataMarker {
  const _$UpdataMarkerImpl(this.position);

  @override
  final Position position;

  @override
  String toString() {
    return 'AddressFormEvent.updateMarker(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdataMarkerImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdataMarkerImplCopyWith<_$UpdataMarkerImpl> get copyWith =>
      __$$UpdataMarkerImplCopyWithImpl<_$UpdataMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return updateMarker(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return updateMarker?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (updateMarker != null) {
      return updateMarker(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return updateMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return updateMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (updateMarker != null) {
      return updateMarker(this);
    }
    return orElse();
  }
}

abstract class _UpdataMarker implements AddressFormEvent {
  const factory _UpdataMarker(final Position position) = _$UpdataMarkerImpl;

  Position get position;
  @JsonKey(ignore: true)
  _$$UpdataMarkerImplCopyWith<_$UpdataMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedAddressTypeImplCopyWith<$Res> {
  factory _$$SelectedAddressTypeImplCopyWith(_$SelectedAddressTypeImpl value,
          $Res Function(_$SelectedAddressTypeImpl) then) =
      __$$SelectedAddressTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$SelectedAddressTypeImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$SelectedAddressTypeImpl>
    implements _$$SelectedAddressTypeImplCopyWith<$Res> {
  __$$SelectedAddressTypeImplCopyWithImpl(_$SelectedAddressTypeImpl _value,
      $Res Function(_$SelectedAddressTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$SelectedAddressTypeImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedAddressTypeImpl implements _SelectedAddressType {
  const _$SelectedAddressTypeImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'AddressFormEvent.selectedAddressType(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedAddressTypeImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedAddressTypeImplCopyWith<_$SelectedAddressTypeImpl> get copyWith =>
      __$$SelectedAddressTypeImplCopyWithImpl<_$SelectedAddressTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return selectedAddressType(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return selectedAddressType?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (selectedAddressType != null) {
      return selectedAddressType(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return selectedAddressType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return selectedAddressType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (selectedAddressType != null) {
      return selectedAddressType(this);
    }
    return orElse();
  }
}

abstract class _SelectedAddressType implements AddressFormEvent {
  const factory _SelectedAddressType(final String v) =
      _$SelectedAddressTypeImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$SelectedAddressTypeImplCopyWith<_$SelectedAddressTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameImplCopyWith<$Res> {
  factory _$$NameImplCopyWith(
          _$NameImpl value, $Res Function(_$NameImpl) then) =
      __$$NameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$NameImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$NameImpl>
    implements _$$NameImplCopyWith<$Res> {
  __$$NameImplCopyWithImpl(_$NameImpl _value, $Res Function(_$NameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$NameImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameImpl implements _Name {
  const _$NameImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'AddressFormEvent.name(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      __$$NameImplCopyWithImpl<_$NameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return name(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return name?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return name(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return name?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(this);
    }
    return orElse();
  }
}

abstract class _Name implements AddressFormEvent {
  const factory _Name(final String v) = _$NameImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$NameImplCopyWith<_$NameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneImplCopyWith<$Res> {
  factory _$$PhoneImplCopyWith(
          _$PhoneImpl value, $Res Function(_$PhoneImpl) then) =
      __$$PhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$PhoneImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$PhoneImpl>
    implements _$$PhoneImplCopyWith<$Res> {
  __$$PhoneImplCopyWithImpl(
      _$PhoneImpl _value, $Res Function(_$PhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$PhoneImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneImpl implements _Phone {
  const _$PhoneImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'AddressFormEvent.phone(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneImplCopyWith<_$PhoneImpl> get copyWith =>
      __$$PhoneImplCopyWithImpl<_$PhoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return phone(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return phone?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return phone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return phone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this);
    }
    return orElse();
  }
}

abstract class _Phone implements AddressFormEvent {
  const factory _Phone(final String v) = _$PhoneImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$PhoneImplCopyWith<_$PhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl();

  @override
  String toString() {
    return 'AddressFormEvent.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements AddressFormEvent {
  const factory _Create() = _$CreateImpl;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AddressFormEvent.update(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) address,
    required TResult Function(AddressArgument args) fetchAddress,
    required TResult Function(String street) fetchStreet,
    required TResult Function(Street v) selectStreet,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapCreated,
    required TResult Function(GoogleMapController controller, LatLng latLng)
        onMapTapped,
    required TResult Function(Position position) updateMarker,
    required TResult Function(String v) selectedAddressType,
    required TResult Function(String v) name,
    required TResult Function(String v) phone,
    required TResult Function() create,
    required TResult Function(int id) update,
  }) {
    return update(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? address,
    TResult? Function(AddressArgument args)? fetchAddress,
    TResult? Function(String street)? fetchStreet,
    TResult? Function(Street v)? selectStreet,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult? Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult? Function(Position position)? updateMarker,
    TResult? Function(String v)? selectedAddressType,
    TResult? Function(String v)? name,
    TResult? Function(String v)? phone,
    TResult? Function()? create,
    TResult? Function(int id)? update,
  }) {
    return update?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? address,
    TResult Function(AddressArgument args)? fetchAddress,
    TResult Function(String street)? fetchStreet,
    TResult Function(Street v)? selectStreet,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapCreated,
    TResult Function(GoogleMapController controller, LatLng latLng)?
        onMapTapped,
    TResult Function(Position position)? updateMarker,
    TResult Function(String v)? selectedAddressType,
    TResult Function(String v)? name,
    TResult Function(String v)? phone,
    TResult Function()? create,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Address value) address,
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_FetchStreet value) fetchStreet,
    required TResult Function(_SelectStreet value) selectStreet,
    required TResult Function(_OnMapCreated value) onMapCreated,
    required TResult Function(_OnMapTapped value) onMapTapped,
    required TResult Function(_UpdataMarker value) updateMarker,
    required TResult Function(_SelectedAddressType value) selectedAddressType,
    required TResult Function(_Name value) name,
    required TResult Function(_Phone value) phone,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Address value)? address,
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_FetchStreet value)? fetchStreet,
    TResult? Function(_SelectStreet value)? selectStreet,
    TResult? Function(_OnMapCreated value)? onMapCreated,
    TResult? Function(_OnMapTapped value)? onMapTapped,
    TResult? Function(_UpdataMarker value)? updateMarker,
    TResult? Function(_SelectedAddressType value)? selectedAddressType,
    TResult? Function(_Name value)? name,
    TResult? Function(_Phone value)? phone,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Address value)? address,
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_FetchStreet value)? fetchStreet,
    TResult Function(_SelectStreet value)? selectStreet,
    TResult Function(_OnMapCreated value)? onMapCreated,
    TResult Function(_OnMapTapped value)? onMapTapped,
    TResult Function(_UpdataMarker value)? updateMarker,
    TResult Function(_SelectedAddressType value)? selectedAddressType,
    TResult Function(_Name value)? name,
    TResult Function(_Phone value)? phone,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements AddressFormEvent {
  const factory _Update(final int id) = _$UpdateImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddressFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isFetchingStreet => throw _privateConstructorUsedError; // Address
  String get address => throw _privateConstructorUsedError; // Google Map
  bool get isMapLoading => throw _privateConstructorUsedError;
  LatLng? get initialLatLng => throw _privateConstructorUsedError;
  LatLng? get selectedLatLng => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError; // Type
  String get selectedAddressType => throw _privateConstructorUsedError;
  List<String> get addressTypeList =>
      throw _privateConstructorUsedError; // Street
  Street? get selectedStreet => throw _privateConstructorUsedError;
  List<Street> get streetList => throw _privateConstructorUsedError; // Users
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get formattedPhoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressFormStateCopyWith<AddressFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFormStateCopyWith<$Res> {
  factory $AddressFormStateCopyWith(
          AddressFormState value, $Res Function(AddressFormState) then) =
      _$AddressFormStateCopyWithImpl<$Res, AddressFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingStreet,
      String address,
      bool isMapLoading,
      LatLng? initialLatLng,
      LatLng? selectedLatLng,
      Set<Marker> markers,
      String selectedAddressType,
      List<String> addressTypeList,
      Street? selectedStreet,
      List<Street> streetList,
      String name,
      String phone,
      String formattedPhoneNumber});
}

/// @nodoc
class _$AddressFormStateCopyWithImpl<$Res, $Val extends AddressFormState>
    implements $AddressFormStateCopyWith<$Res> {
  _$AddressFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isFetchingStreet = null,
    Object? address = null,
    Object? isMapLoading = null,
    Object? initialLatLng = freezed,
    Object? selectedLatLng = freezed,
    Object? markers = null,
    Object? selectedAddressType = null,
    Object? addressTypeList = null,
    Object? selectedStreet = freezed,
    Object? streetList = null,
    Object? name = null,
    Object? phone = null,
    Object? formattedPhoneNumber = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingStreet: null == isFetchingStreet
          ? _value.isFetchingStreet
          : isFetchingStreet // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isMapLoading: null == isMapLoading
          ? _value.isMapLoading
          : isMapLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      initialLatLng: freezed == initialLatLng
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      selectedLatLng: freezed == selectedLatLng
          ? _value.selectedLatLng
          : selectedLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      selectedAddressType: null == selectedAddressType
          ? _value.selectedAddressType
          : selectedAddressType // ignore: cast_nullable_to_non_nullable
              as String,
      addressTypeList: null == addressTypeList
          ? _value.addressTypeList
          : addressTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedStreet: freezed == selectedStreet
          ? _value.selectedStreet
          : selectedStreet // ignore: cast_nullable_to_non_nullable
              as Street?,
      streetList: null == streetList
          ? _value.streetList
          : streetList // ignore: cast_nullable_to_non_nullable
              as List<Street>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressFormStateImplCopyWith<$Res>
    implements $AddressFormStateCopyWith<$Res> {
  factory _$$AddressFormStateImplCopyWith(_$AddressFormStateImpl value,
          $Res Function(_$AddressFormStateImpl) then) =
      __$$AddressFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingStreet,
      String address,
      bool isMapLoading,
      LatLng? initialLatLng,
      LatLng? selectedLatLng,
      Set<Marker> markers,
      String selectedAddressType,
      List<String> addressTypeList,
      Street? selectedStreet,
      List<Street> streetList,
      String name,
      String phone,
      String formattedPhoneNumber});
}

/// @nodoc
class __$$AddressFormStateImplCopyWithImpl<$Res>
    extends _$AddressFormStateCopyWithImpl<$Res, _$AddressFormStateImpl>
    implements _$$AddressFormStateImplCopyWith<$Res> {
  __$$AddressFormStateImplCopyWithImpl(_$AddressFormStateImpl _value,
      $Res Function(_$AddressFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isFetchingStreet = null,
    Object? address = null,
    Object? isMapLoading = null,
    Object? initialLatLng = freezed,
    Object? selectedLatLng = freezed,
    Object? markers = null,
    Object? selectedAddressType = null,
    Object? addressTypeList = null,
    Object? selectedStreet = freezed,
    Object? streetList = null,
    Object? name = null,
    Object? phone = null,
    Object? formattedPhoneNumber = null,
  }) {
    return _then(_$AddressFormStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingStreet: null == isFetchingStreet
          ? _value.isFetchingStreet
          : isFetchingStreet // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isMapLoading: null == isMapLoading
          ? _value.isMapLoading
          : isMapLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      initialLatLng: freezed == initialLatLng
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      selectedLatLng: freezed == selectedLatLng
          ? _value.selectedLatLng
          : selectedLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      selectedAddressType: null == selectedAddressType
          ? _value.selectedAddressType
          : selectedAddressType // ignore: cast_nullable_to_non_nullable
              as String,
      addressTypeList: null == addressTypeList
          ? _value._addressTypeList
          : addressTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedStreet: freezed == selectedStreet
          ? _value.selectedStreet
          : selectedStreet // ignore: cast_nullable_to_non_nullable
              as Street?,
      streetList: null == streetList
          ? _value._streetList
          : streetList // ignore: cast_nullable_to_non_nullable
              as List<Street>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressFormStateImpl implements _AddressFormState {
  const _$AddressFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isFetchingStreet,
      required this.address,
      required this.isMapLoading,
      required this.initialLatLng,
      required this.selectedLatLng,
      required final Set<Marker> markers,
      required this.selectedAddressType,
      required final List<String> addressTypeList,
      required this.selectedStreet,
      required final List<Street> streetList,
      required this.name,
      required this.phone,
      required this.formattedPhoneNumber})
      : _markers = markers,
        _addressTypeList = addressTypeList,
        _streetList = streetList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isFetchingStreet;
// Address
  @override
  final String address;
// Google Map
  @override
  final bool isMapLoading;
  @override
  final LatLng? initialLatLng;
  @override
  final LatLng? selectedLatLng;
  final Set<Marker> _markers;
  @override
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

// Type
  @override
  final String selectedAddressType;
  final List<String> _addressTypeList;
  @override
  List<String> get addressTypeList {
    if (_addressTypeList is EqualUnmodifiableListView) return _addressTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressTypeList);
  }

// Street
  @override
  final Street? selectedStreet;
  final List<Street> _streetList;
  @override
  List<Street> get streetList {
    if (_streetList is EqualUnmodifiableListView) return _streetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streetList);
  }

// Users
  @override
  final String name;
  @override
  final String phone;
  @override
  final String formattedPhoneNumber;

  @override
  String toString() {
    return 'AddressFormState(state: $state, message: $message, isSubmit: $isSubmit, isFetchingStreet: $isFetchingStreet, address: $address, isMapLoading: $isMapLoading, initialLatLng: $initialLatLng, selectedLatLng: $selectedLatLng, markers: $markers, selectedAddressType: $selectedAddressType, addressTypeList: $addressTypeList, selectedStreet: $selectedStreet, streetList: $streetList, name: $name, phone: $phone, formattedPhoneNumber: $formattedPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isFetchingStreet, isFetchingStreet) ||
                other.isFetchingStreet == isFetchingStreet) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isMapLoading, isMapLoading) ||
                other.isMapLoading == isMapLoading) &&
            (identical(other.initialLatLng, initialLatLng) ||
                other.initialLatLng == initialLatLng) &&
            (identical(other.selectedLatLng, selectedLatLng) ||
                other.selectedLatLng == selectedLatLng) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.selectedAddressType, selectedAddressType) ||
                other.selectedAddressType == selectedAddressType) &&
            const DeepCollectionEquality()
                .equals(other._addressTypeList, _addressTypeList) &&
            (identical(other.selectedStreet, selectedStreet) ||
                other.selectedStreet == selectedStreet) &&
            const DeepCollectionEquality()
                .equals(other._streetList, _streetList) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      isSubmit,
      isFetchingStreet,
      address,
      isMapLoading,
      initialLatLng,
      selectedLatLng,
      const DeepCollectionEquality().hash(_markers),
      selectedAddressType,
      const DeepCollectionEquality().hash(_addressTypeList),
      selectedStreet,
      const DeepCollectionEquality().hash(_streetList),
      name,
      phone,
      formattedPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressFormStateImplCopyWith<_$AddressFormStateImpl> get copyWith =>
      __$$AddressFormStateImplCopyWithImpl<_$AddressFormStateImpl>(
          this, _$identity);
}

abstract class _AddressFormState implements AddressFormState {
  const factory _AddressFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isFetchingStreet,
      required final String address,
      required final bool isMapLoading,
      required final LatLng? initialLatLng,
      required final LatLng? selectedLatLng,
      required final Set<Marker> markers,
      required final String selectedAddressType,
      required final List<String> addressTypeList,
      required final Street? selectedStreet,
      required final List<Street> streetList,
      required final String name,
      required final String phone,
      required final String formattedPhoneNumber}) = _$AddressFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isFetchingStreet;
  @override // Address
  String get address;
  @override // Google Map
  bool get isMapLoading;
  @override
  LatLng? get initialLatLng;
  @override
  LatLng? get selectedLatLng;
  @override
  Set<Marker> get markers;
  @override // Type
  String get selectedAddressType;
  @override
  List<String> get addressTypeList;
  @override // Street
  Street? get selectedStreet;
  @override
  List<Street> get streetList;
  @override // Users
  String get name;
  @override
  String get phone;
  @override
  String get formattedPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$AddressFormStateImplCopyWith<_$AddressFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
