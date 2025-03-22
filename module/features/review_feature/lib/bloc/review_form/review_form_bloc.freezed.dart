// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double v) starsOnChanged,
    required TResult Function(String v) reviewOnChanged,
    required TResult Function(int orderId) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double v)? starsOnChanged,
    TResult? Function(String v)? reviewOnChanged,
    TResult? Function(int orderId)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double v)? starsOnChanged,
    TResult Function(String v)? reviewOnChanged,
    TResult Function(int orderId)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StarsOnChanged value) starsOnChanged,
    required TResult Function(_ReviewOnChanged value) reviewOnChanged,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StarsOnChanged value)? starsOnChanged,
    TResult? Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StarsOnChanged value)? starsOnChanged,
    TResult Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewFormEventCopyWith<$Res> {
  factory $ReviewFormEventCopyWith(
          ReviewFormEvent value, $Res Function(ReviewFormEvent) then) =
      _$ReviewFormEventCopyWithImpl<$Res, ReviewFormEvent>;
}

/// @nodoc
class _$ReviewFormEventCopyWithImpl<$Res, $Val extends ReviewFormEvent>
    implements $ReviewFormEventCopyWith<$Res> {
  _$ReviewFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StarsOnChangedImplCopyWith<$Res> {
  factory _$$StarsOnChangedImplCopyWith(_$StarsOnChangedImpl value,
          $Res Function(_$StarsOnChangedImpl) then) =
      __$$StarsOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double v});
}

/// @nodoc
class __$$StarsOnChangedImplCopyWithImpl<$Res>
    extends _$ReviewFormEventCopyWithImpl<$Res, _$StarsOnChangedImpl>
    implements _$$StarsOnChangedImplCopyWith<$Res> {
  __$$StarsOnChangedImplCopyWithImpl(
      _$StarsOnChangedImpl _value, $Res Function(_$StarsOnChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$StarsOnChangedImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StarsOnChangedImpl implements _StarsOnChanged {
  const _$StarsOnChangedImpl(this.v);

  @override
  final double v;

  @override
  String toString() {
    return 'ReviewFormEvent.starsOnChanged(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarsOnChangedImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StarsOnChangedImplCopyWith<_$StarsOnChangedImpl> get copyWith =>
      __$$StarsOnChangedImplCopyWithImpl<_$StarsOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double v) starsOnChanged,
    required TResult Function(String v) reviewOnChanged,
    required TResult Function(int orderId) send,
  }) {
    return starsOnChanged(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double v)? starsOnChanged,
    TResult? Function(String v)? reviewOnChanged,
    TResult? Function(int orderId)? send,
  }) {
    return starsOnChanged?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double v)? starsOnChanged,
    TResult Function(String v)? reviewOnChanged,
    TResult Function(int orderId)? send,
    required TResult orElse(),
  }) {
    if (starsOnChanged != null) {
      return starsOnChanged(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StarsOnChanged value) starsOnChanged,
    required TResult Function(_ReviewOnChanged value) reviewOnChanged,
    required TResult Function(_Send value) send,
  }) {
    return starsOnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StarsOnChanged value)? starsOnChanged,
    TResult? Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult? Function(_Send value)? send,
  }) {
    return starsOnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StarsOnChanged value)? starsOnChanged,
    TResult Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (starsOnChanged != null) {
      return starsOnChanged(this);
    }
    return orElse();
  }
}

abstract class _StarsOnChanged implements ReviewFormEvent {
  const factory _StarsOnChanged(final double v) = _$StarsOnChangedImpl;

  double get v;
  @JsonKey(ignore: true)
  _$$StarsOnChangedImplCopyWith<_$StarsOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewOnChangedImplCopyWith<$Res> {
  factory _$$ReviewOnChangedImplCopyWith(_$ReviewOnChangedImpl value,
          $Res Function(_$ReviewOnChangedImpl) then) =
      __$$ReviewOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$ReviewOnChangedImplCopyWithImpl<$Res>
    extends _$ReviewFormEventCopyWithImpl<$Res, _$ReviewOnChangedImpl>
    implements _$$ReviewOnChangedImplCopyWith<$Res> {
  __$$ReviewOnChangedImplCopyWithImpl(
      _$ReviewOnChangedImpl _value, $Res Function(_$ReviewOnChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$ReviewOnChangedImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewOnChangedImpl implements _ReviewOnChanged {
  const _$ReviewOnChangedImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'ReviewFormEvent.reviewOnChanged(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewOnChangedImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewOnChangedImplCopyWith<_$ReviewOnChangedImpl> get copyWith =>
      __$$ReviewOnChangedImplCopyWithImpl<_$ReviewOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double v) starsOnChanged,
    required TResult Function(String v) reviewOnChanged,
    required TResult Function(int orderId) send,
  }) {
    return reviewOnChanged(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double v)? starsOnChanged,
    TResult? Function(String v)? reviewOnChanged,
    TResult? Function(int orderId)? send,
  }) {
    return reviewOnChanged?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double v)? starsOnChanged,
    TResult Function(String v)? reviewOnChanged,
    TResult Function(int orderId)? send,
    required TResult orElse(),
  }) {
    if (reviewOnChanged != null) {
      return reviewOnChanged(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StarsOnChanged value) starsOnChanged,
    required TResult Function(_ReviewOnChanged value) reviewOnChanged,
    required TResult Function(_Send value) send,
  }) {
    return reviewOnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StarsOnChanged value)? starsOnChanged,
    TResult? Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult? Function(_Send value)? send,
  }) {
    return reviewOnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StarsOnChanged value)? starsOnChanged,
    TResult Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (reviewOnChanged != null) {
      return reviewOnChanged(this);
    }
    return orElse();
  }
}

abstract class _ReviewOnChanged implements ReviewFormEvent {
  const factory _ReviewOnChanged(final String v) = _$ReviewOnChangedImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$ReviewOnChangedImplCopyWith<_$ReviewOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId});
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$ReviewFormEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$SendImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl(this.orderId);

  @override
  final int orderId;

  @override
  String toString() {
    return 'ReviewFormEvent.send(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      __$$SendImplCopyWithImpl<_$SendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double v) starsOnChanged,
    required TResult Function(String v) reviewOnChanged,
    required TResult Function(int orderId) send,
  }) {
    return send(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double v)? starsOnChanged,
    TResult? Function(String v)? reviewOnChanged,
    TResult? Function(int orderId)? send,
  }) {
    return send?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double v)? starsOnChanged,
    TResult Function(String v)? reviewOnChanged,
    TResult Function(int orderId)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StarsOnChanged value) starsOnChanged,
    required TResult Function(_ReviewOnChanged value) reviewOnChanged,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StarsOnChanged value)? starsOnChanged,
    TResult? Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StarsOnChanged value)? starsOnChanged,
    TResult Function(_ReviewOnChanged value)? reviewOnChanged,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements ReviewFormEvent {
  const factory _Send(final int orderId) = _$SendImpl;

  int get orderId;
  @JsonKey(ignore: true)
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isFetchingTransaction => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewFormStateCopyWith<ReviewFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewFormStateCopyWith<$Res> {
  factory $ReviewFormStateCopyWith(
          ReviewFormState value, $Res Function(ReviewFormState) then) =
      _$ReviewFormStateCopyWithImpl<$Res, ReviewFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingTransaction,
      double value,
      String review});
}

/// @nodoc
class _$ReviewFormStateCopyWithImpl<$Res, $Val extends ReviewFormState>
    implements $ReviewFormStateCopyWith<$Res> {
  _$ReviewFormStateCopyWithImpl(this._value, this._then);

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
    Object? isFetchingTransaction = null,
    Object? value = null,
    Object? review = null,
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
      isFetchingTransaction: null == isFetchingTransaction
          ? _value.isFetchingTransaction
          : isFetchingTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewFormStateImplCopyWith<$Res>
    implements $ReviewFormStateCopyWith<$Res> {
  factory _$$ReviewFormStateImplCopyWith(_$ReviewFormStateImpl value,
          $Res Function(_$ReviewFormStateImpl) then) =
      __$$ReviewFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isFetchingTransaction,
      double value,
      String review});
}

/// @nodoc
class __$$ReviewFormStateImplCopyWithImpl<$Res>
    extends _$ReviewFormStateCopyWithImpl<$Res, _$ReviewFormStateImpl>
    implements _$$ReviewFormStateImplCopyWith<$Res> {
  __$$ReviewFormStateImplCopyWithImpl(
      _$ReviewFormStateImpl _value, $Res Function(_$ReviewFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isFetchingTransaction = null,
    Object? value = null,
    Object? review = null,
  }) {
    return _then(_$ReviewFormStateImpl(
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
      isFetchingTransaction: null == isFetchingTransaction
          ? _value.isFetchingTransaction
          : isFetchingTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewFormStateImpl implements _ReviewFormState {
  const _$ReviewFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isFetchingTransaction,
      required this.value,
      required this.review});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isFetchingTransaction;
  @override
  final double value;
  @override
  final String review;

  @override
  String toString() {
    return 'ReviewFormState(state: $state, message: $message, isSubmit: $isSubmit, isFetchingTransaction: $isFetchingTransaction, value: $value, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isFetchingTransaction, isFetchingTransaction) ||
                other.isFetchingTransaction == isFetchingTransaction) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, isSubmit,
      isFetchingTransaction, value, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewFormStateImplCopyWith<_$ReviewFormStateImpl> get copyWith =>
      __$$ReviewFormStateImplCopyWithImpl<_$ReviewFormStateImpl>(
          this, _$identity);
}

abstract class _ReviewFormState implements ReviewFormState {
  const factory _ReviewFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isFetchingTransaction,
      required final double value,
      required final String review}) = _$ReviewFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isFetchingTransaction;
  @override
  double get value;
  @override
  String get review;
  @override
  @JsonKey(ignore: true)
  _$$ReviewFormStateImplCopyWith<_$ReviewFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
