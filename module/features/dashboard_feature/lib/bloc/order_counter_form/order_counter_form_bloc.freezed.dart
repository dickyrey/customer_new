// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_counter_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderCounterFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStock,
    required TResult Function() increaseQty,
    required TResult Function() decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStock,
    TResult? Function()? increaseQty,
    TResult? Function()? decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStock,
    TResult Function()? increaseQty,
    TResult Function()? decreaseQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStock value) getStock,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStock value)? getStock,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStock value)? getStock,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCounterFormEventCopyWith<$Res> {
  factory $OrderCounterFormEventCopyWith(OrderCounterFormEvent value,
          $Res Function(OrderCounterFormEvent) then) =
      _$OrderCounterFormEventCopyWithImpl<$Res, OrderCounterFormEvent>;
}

/// @nodoc
class _$OrderCounterFormEventCopyWithImpl<$Res,
        $Val extends OrderCounterFormEvent>
    implements $OrderCounterFormEventCopyWith<$Res> {
  _$OrderCounterFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetStockImplCopyWith<$Res> {
  factory _$$GetStockImplCopyWith(
          _$GetStockImpl value, $Res Function(_$GetStockImpl) then) =
      __$$GetStockImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetStockImplCopyWithImpl<$Res>
    extends _$OrderCounterFormEventCopyWithImpl<$Res, _$GetStockImpl>
    implements _$$GetStockImplCopyWith<$Res> {
  __$$GetStockImplCopyWithImpl(
      _$GetStockImpl _value, $Res Function(_$GetStockImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetStockImpl implements _GetStock {
  const _$GetStockImpl();

  @override
  String toString() {
    return 'OrderCounterFormEvent.getStock()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetStockImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStock,
    required TResult Function() increaseQty,
    required TResult Function() decreaseQty,
  }) {
    return getStock();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStock,
    TResult? Function()? increaseQty,
    TResult? Function()? decreaseQty,
  }) {
    return getStock?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStock,
    TResult Function()? increaseQty,
    TResult Function()? decreaseQty,
    required TResult orElse(),
  }) {
    if (getStock != null) {
      return getStock();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStock value) getStock,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return getStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStock value)? getStock,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return getStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStock value)? getStock,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (getStock != null) {
      return getStock(this);
    }
    return orElse();
  }
}

abstract class _GetStock implements OrderCounterFormEvent {
  const factory _GetStock() = _$GetStockImpl;
}

/// @nodoc
abstract class _$$IncreaseQtyImplCopyWith<$Res> {
  factory _$$IncreaseQtyImplCopyWith(
          _$IncreaseQtyImpl value, $Res Function(_$IncreaseQtyImpl) then) =
      __$$IncreaseQtyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncreaseQtyImplCopyWithImpl<$Res>
    extends _$OrderCounterFormEventCopyWithImpl<$Res, _$IncreaseQtyImpl>
    implements _$$IncreaseQtyImplCopyWith<$Res> {
  __$$IncreaseQtyImplCopyWithImpl(
      _$IncreaseQtyImpl _value, $Res Function(_$IncreaseQtyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IncreaseQtyImpl implements _IncreaseQty {
  const _$IncreaseQtyImpl();

  @override
  String toString() {
    return 'OrderCounterFormEvent.increaseQty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IncreaseQtyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStock,
    required TResult Function() increaseQty,
    required TResult Function() decreaseQty,
  }) {
    return increaseQty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStock,
    TResult? Function()? increaseQty,
    TResult? Function()? decreaseQty,
  }) {
    return increaseQty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStock,
    TResult Function()? increaseQty,
    TResult Function()? decreaseQty,
    required TResult orElse(),
  }) {
    if (increaseQty != null) {
      return increaseQty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStock value) getStock,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return increaseQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStock value)? getStock,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return increaseQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStock value)? getStock,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (increaseQty != null) {
      return increaseQty(this);
    }
    return orElse();
  }
}

abstract class _IncreaseQty implements OrderCounterFormEvent {
  const factory _IncreaseQty() = _$IncreaseQtyImpl;
}

/// @nodoc
abstract class _$$DecreaseQtyImplCopyWith<$Res> {
  factory _$$DecreaseQtyImplCopyWith(
          _$DecreaseQtyImpl value, $Res Function(_$DecreaseQtyImpl) then) =
      __$$DecreaseQtyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecreaseQtyImplCopyWithImpl<$Res>
    extends _$OrderCounterFormEventCopyWithImpl<$Res, _$DecreaseQtyImpl>
    implements _$$DecreaseQtyImplCopyWith<$Res> {
  __$$DecreaseQtyImplCopyWithImpl(
      _$DecreaseQtyImpl _value, $Res Function(_$DecreaseQtyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DecreaseQtyImpl implements _DecreaseQty {
  const _$DecreaseQtyImpl();

  @override
  String toString() {
    return 'OrderCounterFormEvent.decreaseQty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DecreaseQtyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStock,
    required TResult Function() increaseQty,
    required TResult Function() decreaseQty,
  }) {
    return decreaseQty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStock,
    TResult? Function()? increaseQty,
    TResult? Function()? decreaseQty,
  }) {
    return decreaseQty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStock,
    TResult Function()? increaseQty,
    TResult Function()? decreaseQty,
    required TResult orElse(),
  }) {
    if (decreaseQty != null) {
      return decreaseQty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStock value) getStock,
    required TResult Function(_IncreaseQty value) increaseQty,
    required TResult Function(_DecreaseQty value) decreaseQty,
  }) {
    return decreaseQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStock value)? getStock,
    TResult? Function(_IncreaseQty value)? increaseQty,
    TResult? Function(_DecreaseQty value)? decreaseQty,
  }) {
    return decreaseQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStock value)? getStock,
    TResult Function(_IncreaseQty value)? increaseQty,
    TResult Function(_DecreaseQty value)? decreaseQty,
    required TResult orElse(),
  }) {
    if (decreaseQty != null) {
      return decreaseQty(this);
    }
    return orElse();
  }
}

abstract class _DecreaseQty implements OrderCounterFormEvent {
  const factory _DecreaseQty() = _$DecreaseQtyImpl;
}

/// @nodoc
mixin _$OrderCounterFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError; // Stock
  int get stockRefill => throw _privateConstructorUsedError; // Counter
  int get price => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCounterFormStateCopyWith<OrderCounterFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCounterFormStateCopyWith<$Res> {
  factory $OrderCounterFormStateCopyWith(OrderCounterFormState value,
          $Res Function(OrderCounterFormState) then) =
      _$OrderCounterFormStateCopyWithImpl<$Res, OrderCounterFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      int stockRefill,
      int price,
      int qty,
      int totalPrice});
}

/// @nodoc
class _$OrderCounterFormStateCopyWithImpl<$Res,
        $Val extends OrderCounterFormState>
    implements $OrderCounterFormStateCopyWith<$Res> {
  _$OrderCounterFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? stockRefill = null,
    Object? price = null,
    Object? qty = null,
    Object? totalPrice = null,
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
      stockRefill: null == stockRefill
          ? _value.stockRefill
          : stockRefill // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCounterFormStateImplCopyWith<$Res>
    implements $OrderCounterFormStateCopyWith<$Res> {
  factory _$$OrderCounterFormStateImplCopyWith(
          _$OrderCounterFormStateImpl value,
          $Res Function(_$OrderCounterFormStateImpl) then) =
      __$$OrderCounterFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      int stockRefill,
      int price,
      int qty,
      int totalPrice});
}

/// @nodoc
class __$$OrderCounterFormStateImplCopyWithImpl<$Res>
    extends _$OrderCounterFormStateCopyWithImpl<$Res,
        _$OrderCounterFormStateImpl>
    implements _$$OrderCounterFormStateImplCopyWith<$Res> {
  __$$OrderCounterFormStateImplCopyWithImpl(_$OrderCounterFormStateImpl _value,
      $Res Function(_$OrderCounterFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? stockRefill = null,
    Object? price = null,
    Object? qty = null,
    Object? totalPrice = null,
  }) {
    return _then(_$OrderCounterFormStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stockRefill: null == stockRefill
          ? _value.stockRefill
          : stockRefill // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrderCounterFormStateImpl implements _OrderCounterFormState {
  const _$OrderCounterFormStateImpl(
      {required this.state,
      required this.message,
      required this.stockRefill,
      required this.price,
      required this.qty,
      required this.totalPrice});

  @override
  final RequestState state;
  @override
  final String message;
// Stock
  @override
  final int stockRefill;
// Counter
  @override
  final int price;
  @override
  final int qty;
  @override
  final int totalPrice;

  @override
  String toString() {
    return 'OrderCounterFormState(state: $state, message: $message, stockRefill: $stockRefill, price: $price, qty: $qty, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCounterFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stockRefill, stockRefill) ||
                other.stockRefill == stockRefill) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, state, message, stockRefill, price, qty, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCounterFormStateImplCopyWith<_$OrderCounterFormStateImpl>
      get copyWith => __$$OrderCounterFormStateImplCopyWithImpl<
          _$OrderCounterFormStateImpl>(this, _$identity);
}

abstract class _OrderCounterFormState implements OrderCounterFormState {
  const factory _OrderCounterFormState(
      {required final RequestState state,
      required final String message,
      required final int stockRefill,
      required final int price,
      required final int qty,
      required final int totalPrice}) = _$OrderCounterFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override // Stock
  int get stockRefill;
  @override // Counter
  int get price;
  @override
  int get qty;
  @override
  int get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderCounterFormStateImplCopyWith<_$OrderCounterFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
