// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() point,
    required TResult Function() getPaymentList,
    required TResult Function(TransactionPayment v) selectPayment,
    required TResult Function(int addressId, int qty) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? point,
    TResult? Function()? getPaymentList,
    TResult? Function(TransactionPayment v)? selectPayment,
    TResult? Function(int addressId, int qty)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? point,
    TResult Function()? getPaymentList,
    TResult Function(TransactionPayment v)? selectPayment,
    TResult Function(int addressId, int qty)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Point value) point,
    required TResult Function(_GetPaymentList value) getPaymentList,
    required TResult Function(_SelectPayment value) selectPayment,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Point value)? point,
    TResult? Function(_GetPaymentList value)? getPaymentList,
    TResult? Function(_SelectPayment value)? selectPayment,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Point value)? point,
    TResult Function(_GetPaymentList value)? getPaymentList,
    TResult Function(_SelectPayment value)? selectPayment,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutFormEventCopyWith<$Res> {
  factory $CheckoutFormEventCopyWith(
          CheckoutFormEvent value, $Res Function(CheckoutFormEvent) then) =
      _$CheckoutFormEventCopyWithImpl<$Res, CheckoutFormEvent>;
}

/// @nodoc
class _$CheckoutFormEventCopyWithImpl<$Res, $Val extends CheckoutFormEvent>
    implements $CheckoutFormEventCopyWith<$Res> {
  _$CheckoutFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$CheckoutFormEventCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PointImpl implements _Point {
  const _$PointImpl();

  @override
  String toString() {
    return 'CheckoutFormEvent.point()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PointImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() point,
    required TResult Function() getPaymentList,
    required TResult Function(TransactionPayment v) selectPayment,
    required TResult Function(int addressId, int qty) send,
  }) {
    return point();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? point,
    TResult? Function()? getPaymentList,
    TResult? Function(TransactionPayment v)? selectPayment,
    TResult? Function(int addressId, int qty)? send,
  }) {
    return point?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? point,
    TResult Function()? getPaymentList,
    TResult Function(TransactionPayment v)? selectPayment,
    TResult Function(int addressId, int qty)? send,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Point value) point,
    required TResult Function(_GetPaymentList value) getPaymentList,
    required TResult Function(_SelectPayment value) selectPayment,
    required TResult Function(_Send value) send,
  }) {
    return point(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Point value)? point,
    TResult? Function(_GetPaymentList value)? getPaymentList,
    TResult? Function(_SelectPayment value)? selectPayment,
    TResult? Function(_Send value)? send,
  }) {
    return point?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Point value)? point,
    TResult Function(_GetPaymentList value)? getPaymentList,
    TResult Function(_SelectPayment value)? selectPayment,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point(this);
    }
    return orElse();
  }
}

abstract class _Point implements CheckoutFormEvent {
  const factory _Point() = _$PointImpl;
}

/// @nodoc
abstract class _$$GetPaymentListImplCopyWith<$Res> {
  factory _$$GetPaymentListImplCopyWith(_$GetPaymentListImpl value,
          $Res Function(_$GetPaymentListImpl) then) =
      __$$GetPaymentListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPaymentListImplCopyWithImpl<$Res>
    extends _$CheckoutFormEventCopyWithImpl<$Res, _$GetPaymentListImpl>
    implements _$$GetPaymentListImplCopyWith<$Res> {
  __$$GetPaymentListImplCopyWithImpl(
      _$GetPaymentListImpl _value, $Res Function(_$GetPaymentListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPaymentListImpl implements _GetPaymentList {
  const _$GetPaymentListImpl();

  @override
  String toString() {
    return 'CheckoutFormEvent.getPaymentList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPaymentListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() point,
    required TResult Function() getPaymentList,
    required TResult Function(TransactionPayment v) selectPayment,
    required TResult Function(int addressId, int qty) send,
  }) {
    return getPaymentList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? point,
    TResult? Function()? getPaymentList,
    TResult? Function(TransactionPayment v)? selectPayment,
    TResult? Function(int addressId, int qty)? send,
  }) {
    return getPaymentList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? point,
    TResult Function()? getPaymentList,
    TResult Function(TransactionPayment v)? selectPayment,
    TResult Function(int addressId, int qty)? send,
    required TResult orElse(),
  }) {
    if (getPaymentList != null) {
      return getPaymentList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Point value) point,
    required TResult Function(_GetPaymentList value) getPaymentList,
    required TResult Function(_SelectPayment value) selectPayment,
    required TResult Function(_Send value) send,
  }) {
    return getPaymentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Point value)? point,
    TResult? Function(_GetPaymentList value)? getPaymentList,
    TResult? Function(_SelectPayment value)? selectPayment,
    TResult? Function(_Send value)? send,
  }) {
    return getPaymentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Point value)? point,
    TResult Function(_GetPaymentList value)? getPaymentList,
    TResult Function(_SelectPayment value)? selectPayment,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (getPaymentList != null) {
      return getPaymentList(this);
    }
    return orElse();
  }
}

abstract class _GetPaymentList implements CheckoutFormEvent {
  const factory _GetPaymentList() = _$GetPaymentListImpl;
}

/// @nodoc
abstract class _$$SelectPaymentImplCopyWith<$Res> {
  factory _$$SelectPaymentImplCopyWith(
          _$SelectPaymentImpl value, $Res Function(_$SelectPaymentImpl) then) =
      __$$SelectPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionPayment v});
}

/// @nodoc
class __$$SelectPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutFormEventCopyWithImpl<$Res, _$SelectPaymentImpl>
    implements _$$SelectPaymentImplCopyWith<$Res> {
  __$$SelectPaymentImplCopyWithImpl(
      _$SelectPaymentImpl _value, $Res Function(_$SelectPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$SelectPaymentImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as TransactionPayment,
    ));
  }
}

/// @nodoc

class _$SelectPaymentImpl implements _SelectPayment {
  const _$SelectPaymentImpl(this.v);

  @override
  final TransactionPayment v;

  @override
  String toString() {
    return 'CheckoutFormEvent.selectPayment(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPaymentImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPaymentImplCopyWith<_$SelectPaymentImpl> get copyWith =>
      __$$SelectPaymentImplCopyWithImpl<_$SelectPaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() point,
    required TResult Function() getPaymentList,
    required TResult Function(TransactionPayment v) selectPayment,
    required TResult Function(int addressId, int qty) send,
  }) {
    return selectPayment(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? point,
    TResult? Function()? getPaymentList,
    TResult? Function(TransactionPayment v)? selectPayment,
    TResult? Function(int addressId, int qty)? send,
  }) {
    return selectPayment?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? point,
    TResult Function()? getPaymentList,
    TResult Function(TransactionPayment v)? selectPayment,
    TResult Function(int addressId, int qty)? send,
    required TResult orElse(),
  }) {
    if (selectPayment != null) {
      return selectPayment(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Point value) point,
    required TResult Function(_GetPaymentList value) getPaymentList,
    required TResult Function(_SelectPayment value) selectPayment,
    required TResult Function(_Send value) send,
  }) {
    return selectPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Point value)? point,
    TResult? Function(_GetPaymentList value)? getPaymentList,
    TResult? Function(_SelectPayment value)? selectPayment,
    TResult? Function(_Send value)? send,
  }) {
    return selectPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Point value)? point,
    TResult Function(_GetPaymentList value)? getPaymentList,
    TResult Function(_SelectPayment value)? selectPayment,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (selectPayment != null) {
      return selectPayment(this);
    }
    return orElse();
  }
}

abstract class _SelectPayment implements CheckoutFormEvent {
  const factory _SelectPayment(final TransactionPayment v) =
      _$SelectPaymentImpl;

  TransactionPayment get v;
  @JsonKey(ignore: true)
  _$$SelectPaymentImplCopyWith<_$SelectPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int addressId, int qty});
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$CheckoutFormEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? qty = null,
  }) {
    return _then(_$SendImpl(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl({required this.addressId, required this.qty});

  @override
  final int addressId;
  @override
  final int qty;

  @override
  String toString() {
    return 'CheckoutFormEvent.send(addressId: $addressId, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      __$$SendImplCopyWithImpl<_$SendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() point,
    required TResult Function() getPaymentList,
    required TResult Function(TransactionPayment v) selectPayment,
    required TResult Function(int addressId, int qty) send,
  }) {
    return send(addressId, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? point,
    TResult? Function()? getPaymentList,
    TResult? Function(TransactionPayment v)? selectPayment,
    TResult? Function(int addressId, int qty)? send,
  }) {
    return send?.call(addressId, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? point,
    TResult Function()? getPaymentList,
    TResult Function(TransactionPayment v)? selectPayment,
    TResult Function(int addressId, int qty)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(addressId, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Point value) point,
    required TResult Function(_GetPaymentList value) getPaymentList,
    required TResult Function(_SelectPayment value) selectPayment,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Point value)? point,
    TResult? Function(_GetPaymentList value)? getPaymentList,
    TResult? Function(_SelectPayment value)? selectPayment,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Point value)? point,
    TResult Function(_GetPaymentList value)? getPaymentList,
    TResult Function(_SelectPayment value)? selectPayment,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements CheckoutFormEvent {
  const factory _Send({required final int addressId, required final int qty}) =
      _$SendImpl;

  int get addressId;
  int get qty;
  @JsonKey(ignore: true)
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isPaymentListLoading => throw _privateConstructorUsedError;
  bool get isPaymentListError =>
      throw _privateConstructorUsedError; // Point Activation
  bool get isPointActive =>
      throw _privateConstructorUsedError; // Payment Method
  TransactionPayment? get selectedPayment => throw _privateConstructorUsedError;
  List<TransactionPayment> get paymentList =>
      throw _privateConstructorUsedError; // Transaction Detail
  TransactionDetail? get transactionDetail =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutFormStateCopyWith<CheckoutFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutFormStateCopyWith<$Res> {
  factory $CheckoutFormStateCopyWith(
          CheckoutFormState value, $Res Function(CheckoutFormState) then) =
      _$CheckoutFormStateCopyWithImpl<$Res, CheckoutFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isPaymentListLoading,
      bool isPaymentListError,
      bool isPointActive,
      TransactionPayment? selectedPayment,
      List<TransactionPayment> paymentList,
      TransactionDetail? transactionDetail});
}

/// @nodoc
class _$CheckoutFormStateCopyWithImpl<$Res, $Val extends CheckoutFormState>
    implements $CheckoutFormStateCopyWith<$Res> {
  _$CheckoutFormStateCopyWithImpl(this._value, this._then);

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
    Object? isPaymentListLoading = null,
    Object? isPaymentListError = null,
    Object? isPointActive = null,
    Object? selectedPayment = freezed,
    Object? paymentList = null,
    Object? transactionDetail = freezed,
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
      isPaymentListLoading: null == isPaymentListLoading
          ? _value.isPaymentListLoading
          : isPaymentListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentListError: null == isPaymentListError
          ? _value.isPaymentListError
          : isPaymentListError // ignore: cast_nullable_to_non_nullable
              as bool,
      isPointActive: null == isPointActive
          ? _value.isPointActive
          : isPointActive // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPayment: freezed == selectedPayment
          ? _value.selectedPayment
          : selectedPayment // ignore: cast_nullable_to_non_nullable
              as TransactionPayment?,
      paymentList: null == paymentList
          ? _value.paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<TransactionPayment>,
      transactionDetail: freezed == transactionDetail
          ? _value.transactionDetail
          : transactionDetail // ignore: cast_nullable_to_non_nullable
              as TransactionDetail?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutFormStateImplCopyWith<$Res>
    implements $CheckoutFormStateCopyWith<$Res> {
  factory _$$CheckoutFormStateImplCopyWith(_$CheckoutFormStateImpl value,
          $Res Function(_$CheckoutFormStateImpl) then) =
      __$$CheckoutFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isPaymentListLoading,
      bool isPaymentListError,
      bool isPointActive,
      TransactionPayment? selectedPayment,
      List<TransactionPayment> paymentList,
      TransactionDetail? transactionDetail});
}

/// @nodoc
class __$$CheckoutFormStateImplCopyWithImpl<$Res>
    extends _$CheckoutFormStateCopyWithImpl<$Res, _$CheckoutFormStateImpl>
    implements _$$CheckoutFormStateImplCopyWith<$Res> {
  __$$CheckoutFormStateImplCopyWithImpl(_$CheckoutFormStateImpl _value,
      $Res Function(_$CheckoutFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isPaymentListLoading = null,
    Object? isPaymentListError = null,
    Object? isPointActive = null,
    Object? selectedPayment = freezed,
    Object? paymentList = null,
    Object? transactionDetail = freezed,
  }) {
    return _then(_$CheckoutFormStateImpl(
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
      isPaymentListLoading: null == isPaymentListLoading
          ? _value.isPaymentListLoading
          : isPaymentListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentListError: null == isPaymentListError
          ? _value.isPaymentListError
          : isPaymentListError // ignore: cast_nullable_to_non_nullable
              as bool,
      isPointActive: null == isPointActive
          ? _value.isPointActive
          : isPointActive // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPayment: freezed == selectedPayment
          ? _value.selectedPayment
          : selectedPayment // ignore: cast_nullable_to_non_nullable
              as TransactionPayment?,
      paymentList: null == paymentList
          ? _value._paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<TransactionPayment>,
      transactionDetail: freezed == transactionDetail
          ? _value.transactionDetail
          : transactionDetail // ignore: cast_nullable_to_non_nullable
              as TransactionDetail?,
    ));
  }
}

/// @nodoc

class _$CheckoutFormStateImpl implements _CheckoutFormState {
  const _$CheckoutFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isPaymentListLoading,
      required this.isPaymentListError,
      required this.isPointActive,
      required this.selectedPayment,
      required final List<TransactionPayment> paymentList,
      required this.transactionDetail})
      : _paymentList = paymentList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isPaymentListLoading;
  @override
  final bool isPaymentListError;
// Point Activation
  @override
  final bool isPointActive;
// Payment Method
  @override
  final TransactionPayment? selectedPayment;
  final List<TransactionPayment> _paymentList;
  @override
  List<TransactionPayment> get paymentList {
    if (_paymentList is EqualUnmodifiableListView) return _paymentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentList);
  }

// Transaction Detail
  @override
  final TransactionDetail? transactionDetail;

  @override
  String toString() {
    return 'CheckoutFormState(state: $state, message: $message, isSubmit: $isSubmit, isPaymentListLoading: $isPaymentListLoading, isPaymentListError: $isPaymentListError, isPointActive: $isPointActive, selectedPayment: $selectedPayment, paymentList: $paymentList, transactionDetail: $transactionDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isPaymentListLoading, isPaymentListLoading) ||
                other.isPaymentListLoading == isPaymentListLoading) &&
            (identical(other.isPaymentListError, isPaymentListError) ||
                other.isPaymentListError == isPaymentListError) &&
            (identical(other.isPointActive, isPointActive) ||
                other.isPointActive == isPointActive) &&
            (identical(other.selectedPayment, selectedPayment) ||
                other.selectedPayment == selectedPayment) &&
            const DeepCollectionEquality()
                .equals(other._paymentList, _paymentList) &&
            (identical(other.transactionDetail, transactionDetail) ||
                other.transactionDetail == transactionDetail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      isSubmit,
      isPaymentListLoading,
      isPaymentListError,
      isPointActive,
      selectedPayment,
      const DeepCollectionEquality().hash(_paymentList),
      transactionDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutFormStateImplCopyWith<_$CheckoutFormStateImpl> get copyWith =>
      __$$CheckoutFormStateImplCopyWithImpl<_$CheckoutFormStateImpl>(
          this, _$identity);
}

abstract class _CheckoutFormState implements CheckoutFormState {
  const factory _CheckoutFormState(
          {required final RequestState state,
          required final String message,
          required final bool isSubmit,
          required final bool isPaymentListLoading,
          required final bool isPaymentListError,
          required final bool isPointActive,
          required final TransactionPayment? selectedPayment,
          required final List<TransactionPayment> paymentList,
          required final TransactionDetail? transactionDetail}) =
      _$CheckoutFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isPaymentListLoading;
  @override
  bool get isPaymentListError;
  @override // Point Activation
  bool get isPointActive;
  @override // Payment Method
  TransactionPayment? get selectedPayment;
  @override
  List<TransactionPayment> get paymentList;
  @override // Transaction Detail
  TransactionDetail? get transactionDetail;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutFormStateImplCopyWith<_$CheckoutFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
