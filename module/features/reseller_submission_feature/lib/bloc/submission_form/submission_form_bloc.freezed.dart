// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmissionFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function(Address address) selectAddress,
    required TResult Function(String v) onChanged,
    required TResult Function() send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function(Address address)? selectAddress,
    TResult? Function(String v)? onChanged,
    TResult? Function()? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function(Address address)? selectAddress,
    TResult Function(String v)? onChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_OnChanged value) onChanged,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_OnChanged value)? onChanged,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_OnChanged value)? onChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionFormEventCopyWith<$Res> {
  factory $SubmissionFormEventCopyWith(
          SubmissionFormEvent value, $Res Function(SubmissionFormEvent) then) =
      _$SubmissionFormEventCopyWithImpl<$Res, SubmissionFormEvent>;
}

/// @nodoc
class _$SubmissionFormEventCopyWithImpl<$Res, $Val extends SubmissionFormEvent>
    implements $SubmissionFormEventCopyWith<$Res> {
  _$SubmissionFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchAddressImplCopyWith<$Res> {
  factory _$$FetchAddressImplCopyWith(
          _$FetchAddressImpl value, $Res Function(_$FetchAddressImpl) then) =
      __$$FetchAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAddressImplCopyWithImpl<$Res>
    extends _$SubmissionFormEventCopyWithImpl<$Res, _$FetchAddressImpl>
    implements _$$FetchAddressImplCopyWith<$Res> {
  __$$FetchAddressImplCopyWithImpl(
      _$FetchAddressImpl _value, $Res Function(_$FetchAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAddressImpl implements _FetchAddress {
  const _$FetchAddressImpl();

  @override
  String toString() {
    return 'SubmissionFormEvent.fetchAddress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function(Address address) selectAddress,
    required TResult Function(String v) onChanged,
    required TResult Function() send,
  }) {
    return fetchAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function(Address address)? selectAddress,
    TResult? Function(String v)? onChanged,
    TResult? Function()? send,
  }) {
    return fetchAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function(Address address)? selectAddress,
    TResult Function(String v)? onChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_OnChanged value) onChanged,
    required TResult Function(_Send value) send,
  }) {
    return fetchAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_OnChanged value)? onChanged,
    TResult? Function(_Send value)? send,
  }) {
    return fetchAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_OnChanged value)? onChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (fetchAddress != null) {
      return fetchAddress(this);
    }
    return orElse();
  }
}

abstract class _FetchAddress implements SubmissionFormEvent {
  const factory _FetchAddress() = _$FetchAddressImpl;
}

/// @nodoc
abstract class _$$SelectAddressImplCopyWith<$Res> {
  factory _$$SelectAddressImplCopyWith(
          _$SelectAddressImpl value, $Res Function(_$SelectAddressImpl) then) =
      __$$SelectAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Address address});
}

/// @nodoc
class __$$SelectAddressImplCopyWithImpl<$Res>
    extends _$SubmissionFormEventCopyWithImpl<$Res, _$SelectAddressImpl>
    implements _$$SelectAddressImplCopyWith<$Res> {
  __$$SelectAddressImplCopyWithImpl(
      _$SelectAddressImpl _value, $Res Function(_$SelectAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$SelectAddressImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc

class _$SelectAddressImpl implements _SelectAddress {
  const _$SelectAddressImpl(this.address);

  @override
  final Address address;

  @override
  String toString() {
    return 'SubmissionFormEvent.selectAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      __$$SelectAddressImplCopyWithImpl<_$SelectAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function(Address address) selectAddress,
    required TResult Function(String v) onChanged,
    required TResult Function() send,
  }) {
    return selectAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function(Address address)? selectAddress,
    TResult? Function(String v)? onChanged,
    TResult? Function()? send,
  }) {
    return selectAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function(Address address)? selectAddress,
    TResult Function(String v)? onChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_OnChanged value) onChanged,
    required TResult Function(_Send value) send,
  }) {
    return selectAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_OnChanged value)? onChanged,
    TResult? Function(_Send value)? send,
  }) {
    return selectAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_OnChanged value)? onChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(this);
    }
    return orElse();
  }
}

abstract class _SelectAddress implements SubmissionFormEvent {
  const factory _SelectAddress(final Address address) = _$SelectAddressImpl;

  Address get address;
  @JsonKey(ignore: true)
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangedImplCopyWith<$Res> {
  factory _$$OnChangedImplCopyWith(
          _$OnChangedImpl value, $Res Function(_$OnChangedImpl) then) =
      __$$OnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$OnChangedImplCopyWithImpl<$Res>
    extends _$SubmissionFormEventCopyWithImpl<$Res, _$OnChangedImpl>
    implements _$$OnChangedImplCopyWith<$Res> {
  __$$OnChangedImplCopyWithImpl(
      _$OnChangedImpl _value, $Res Function(_$OnChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$OnChangedImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnChangedImpl implements _OnChanged {
  const _$OnChangedImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'SubmissionFormEvent.onChanged(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangedImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangedImplCopyWith<_$OnChangedImpl> get copyWith =>
      __$$OnChangedImplCopyWithImpl<_$OnChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function(Address address) selectAddress,
    required TResult Function(String v) onChanged,
    required TResult Function() send,
  }) {
    return onChanged(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function(Address address)? selectAddress,
    TResult? Function(String v)? onChanged,
    TResult? Function()? send,
  }) {
    return onChanged?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function(Address address)? selectAddress,
    TResult Function(String v)? onChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (onChanged != null) {
      return onChanged(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_OnChanged value) onChanged,
    required TResult Function(_Send value) send,
  }) {
    return onChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_OnChanged value)? onChanged,
    TResult? Function(_Send value)? send,
  }) {
    return onChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_OnChanged value)? onChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (onChanged != null) {
      return onChanged(this);
    }
    return orElse();
  }
}

abstract class _OnChanged implements SubmissionFormEvent {
  const factory _OnChanged(final String v) = _$OnChangedImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$OnChangedImplCopyWith<_$OnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$SubmissionFormEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl();

  @override
  String toString() {
    return 'SubmissionFormEvent.send()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAddress,
    required TResult Function(Address address) selectAddress,
    required TResult Function(String v) onChanged,
    required TResult Function() send,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAddress,
    TResult? Function(Address address)? selectAddress,
    TResult? Function(String v)? onChanged,
    TResult? Function()? send,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAddress,
    TResult Function(Address address)? selectAddress,
    TResult Function(String v)? onChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAddress value) fetchAddress,
    required TResult Function(_SelectAddress value) selectAddress,
    required TResult Function(_OnChanged value) onChanged,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAddress value)? fetchAddress,
    TResult? Function(_SelectAddress value)? selectAddress,
    TResult? Function(_OnChanged value)? onChanged,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAddress value)? fetchAddress,
    TResult Function(_SelectAddress value)? selectAddress,
    TResult Function(_OnChanged value)? onChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements SubmissionFormEvent {
  const factory _Send() = _$SendImpl;
}

/// @nodoc
mixin _$SubmissionFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError; // Address
  bool get isFetchingAddress => throw _privateConstructorUsedError;
  List<Address> get addressList => throw _privateConstructorUsedError;
  Address? get selectedAddress => throw _privateConstructorUsedError; // Store
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmissionFormStateCopyWith<SubmissionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionFormStateCopyWith<$Res> {
  factory $SubmissionFormStateCopyWith(
          SubmissionFormState value, $Res Function(SubmissionFormState) then) =
      _$SubmissionFormStateCopyWithImpl<$Res, SubmissionFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingAddress,
      List<Address> addressList,
      Address? selectedAddress,
      String name});
}

/// @nodoc
class _$SubmissionFormStateCopyWithImpl<$Res, $Val extends SubmissionFormState>
    implements $SubmissionFormStateCopyWith<$Res> {
  _$SubmissionFormStateCopyWithImpl(this._value, this._then);

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
    Object? isFetchingAddress = null,
    Object? addressList = null,
    Object? selectedAddress = freezed,
    Object? name = null,
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
      isFetchingAddress: null == isFetchingAddress
          ? _value.isFetchingAddress
          : isFetchingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      addressList: null == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmissionFormStateImplCopyWith<$Res>
    implements $SubmissionFormStateCopyWith<$Res> {
  factory _$$SubmissionFormStateImplCopyWith(_$SubmissionFormStateImpl value,
          $Res Function(_$SubmissionFormStateImpl) then) =
      __$$SubmissionFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingAddress,
      List<Address> addressList,
      Address? selectedAddress,
      String name});
}

/// @nodoc
class __$$SubmissionFormStateImplCopyWithImpl<$Res>
    extends _$SubmissionFormStateCopyWithImpl<$Res, _$SubmissionFormStateImpl>
    implements _$$SubmissionFormStateImplCopyWith<$Res> {
  __$$SubmissionFormStateImplCopyWithImpl(_$SubmissionFormStateImpl _value,
      $Res Function(_$SubmissionFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isFetchingAddress = null,
    Object? addressList = null,
    Object? selectedAddress = freezed,
    Object? name = null,
  }) {
    return _then(_$SubmissionFormStateImpl(
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
      isFetchingAddress: null == isFetchingAddress
          ? _value.isFetchingAddress
          : isFetchingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      addressList: null == addressList
          ? _value._addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmissionFormStateImpl implements _SubmissionFormState {
  const _$SubmissionFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isFetchingAddress,
      required final List<Address> addressList,
      required this.selectedAddress,
      required this.name})
      : _addressList = addressList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
// Address
  @override
  final bool isFetchingAddress;
  final List<Address> _addressList;
  @override
  List<Address> get addressList {
    if (_addressList is EqualUnmodifiableListView) return _addressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressList);
  }

  @override
  final Address? selectedAddress;
// Store
  @override
  final String name;

  @override
  String toString() {
    return 'SubmissionFormState(state: $state, message: $message, isSubmit: $isSubmit, isFetchingAddress: $isFetchingAddress, addressList: $addressList, selectedAddress: $selectedAddress, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isFetchingAddress, isFetchingAddress) ||
                other.isFetchingAddress == isFetchingAddress) &&
            const DeepCollectionEquality()
                .equals(other._addressList, _addressList) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      isSubmit,
      isFetchingAddress,
      const DeepCollectionEquality().hash(_addressList),
      selectedAddress,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionFormStateImplCopyWith<_$SubmissionFormStateImpl> get copyWith =>
      __$$SubmissionFormStateImplCopyWithImpl<_$SubmissionFormStateImpl>(
          this, _$identity);
}

abstract class _SubmissionFormState implements SubmissionFormState {
  const factory _SubmissionFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isFetchingAddress,
      required final List<Address> addressList,
      required final Address? selectedAddress,
      required final String name}) = _$SubmissionFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override // Address
  bool get isFetchingAddress;
  @override
  List<Address> get addressList;
  @override
  Address? get selectedAddress;
  @override // Store
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SubmissionFormStateImplCopyWith<_$SubmissionFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
