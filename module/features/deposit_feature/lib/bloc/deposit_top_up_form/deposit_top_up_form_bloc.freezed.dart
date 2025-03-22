// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_top_up_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DepositTopUpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) deposit,
    required TResult Function() send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? deposit,
    TResult? Function()? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? deposit,
    TResult Function()? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deposit value) deposit,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deposit value)? deposit,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deposit value)? deposit,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositTopUpFormEventCopyWith<$Res> {
  factory $DepositTopUpFormEventCopyWith(DepositTopUpFormEvent value,
          $Res Function(DepositTopUpFormEvent) then) =
      _$DepositTopUpFormEventCopyWithImpl<$Res, DepositTopUpFormEvent>;
}

/// @nodoc
class _$DepositTopUpFormEventCopyWithImpl<$Res,
        $Val extends DepositTopUpFormEvent>
    implements $DepositTopUpFormEventCopyWith<$Res> {
  _$DepositTopUpFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DepositImplCopyWith<$Res> {
  factory _$$DepositImplCopyWith(
          _$DepositImpl value, $Res Function(_$DepositImpl) then) =
      __$$DepositImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$DepositImplCopyWithImpl<$Res>
    extends _$DepositTopUpFormEventCopyWithImpl<$Res, _$DepositImpl>
    implements _$$DepositImplCopyWith<$Res> {
  __$$DepositImplCopyWithImpl(
      _$DepositImpl _value, $Res Function(_$DepositImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$DepositImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DepositImpl implements _Deposit {
  const _$DepositImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'DepositTopUpFormEvent.deposit(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
      __$$DepositImplCopyWithImpl<_$DepositImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) deposit,
    required TResult Function() send,
  }) {
    return deposit(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? deposit,
    TResult? Function()? send,
  }) {
    return deposit?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? deposit,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (deposit != null) {
      return deposit(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deposit value) deposit,
    required TResult Function(_Send value) send,
  }) {
    return deposit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deposit value)? deposit,
    TResult? Function(_Send value)? send,
  }) {
    return deposit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deposit value)? deposit,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (deposit != null) {
      return deposit(this);
    }
    return orElse();
  }
}

abstract class _Deposit implements DepositTopUpFormEvent {
  const factory _Deposit(final String v) = _$DepositImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$DepositImplCopyWith<_$DepositImpl> get copyWith =>
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
    extends _$DepositTopUpFormEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl();

  @override
  String toString() {
    return 'DepositTopUpFormEvent.send()';
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
    required TResult Function(String v) deposit,
    required TResult Function() send,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? deposit,
    TResult? Function()? send,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? deposit,
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
    required TResult Function(_Deposit value) deposit,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deposit value)? deposit,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deposit value)? deposit,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements DepositTopUpFormEvent {
  const factory _Send() = _$SendImpl;
}

/// @nodoc
mixin _$DepositTopUpFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  String get deposit => throw _privateConstructorUsedError;
  DepositDetail? get depositDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DepositTopUpFormStateCopyWith<DepositTopUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositTopUpFormStateCopyWith<$Res> {
  factory $DepositTopUpFormStateCopyWith(DepositTopUpFormState value,
          $Res Function(DepositTopUpFormState) then) =
      _$DepositTopUpFormStateCopyWithImpl<$Res, DepositTopUpFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      String deposit,
      DepositDetail? depositDetail});
}

/// @nodoc
class _$DepositTopUpFormStateCopyWithImpl<$Res,
        $Val extends DepositTopUpFormState>
    implements $DepositTopUpFormStateCopyWith<$Res> {
  _$DepositTopUpFormStateCopyWithImpl(this._value, this._then);

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
    Object? deposit = null,
    Object? depositDetail = freezed,
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
      deposit: null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as String,
      depositDetail: freezed == depositDetail
          ? _value.depositDetail
          : depositDetail // ignore: cast_nullable_to_non_nullable
              as DepositDetail?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositTopUpFormStateImplCopyWith<$Res>
    implements $DepositTopUpFormStateCopyWith<$Res> {
  factory _$$DepositTopUpFormStateImplCopyWith(
          _$DepositTopUpFormStateImpl value,
          $Res Function(_$DepositTopUpFormStateImpl) then) =
      __$$DepositTopUpFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      String deposit,
      DepositDetail? depositDetail});
}

/// @nodoc
class __$$DepositTopUpFormStateImplCopyWithImpl<$Res>
    extends _$DepositTopUpFormStateCopyWithImpl<$Res,
        _$DepositTopUpFormStateImpl>
    implements _$$DepositTopUpFormStateImplCopyWith<$Res> {
  __$$DepositTopUpFormStateImplCopyWithImpl(_$DepositTopUpFormStateImpl _value,
      $Res Function(_$DepositTopUpFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? deposit = null,
    Object? depositDetail = freezed,
  }) {
    return _then(_$DepositTopUpFormStateImpl(
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
      deposit: null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as String,
      depositDetail: freezed == depositDetail
          ? _value.depositDetail
          : depositDetail // ignore: cast_nullable_to_non_nullable
              as DepositDetail?,
    ));
  }
}

/// @nodoc

class _$DepositTopUpFormStateImpl implements _DepositTopUpFormState {
  const _$DepositTopUpFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.deposit,
      required this.depositDetail});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final String deposit;
  @override
  final DepositDetail? depositDetail;

  @override
  String toString() {
    return 'DepositTopUpFormState(state: $state, message: $message, isSubmit: $isSubmit, deposit: $deposit, depositDetail: $depositDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositTopUpFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.deposit, deposit) || other.deposit == deposit) &&
            (identical(other.depositDetail, depositDetail) ||
                other.depositDetail == depositDetail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, state, message, isSubmit, deposit, depositDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositTopUpFormStateImplCopyWith<_$DepositTopUpFormStateImpl>
      get copyWith => __$$DepositTopUpFormStateImplCopyWithImpl<
          _$DepositTopUpFormStateImpl>(this, _$identity);
}

abstract class _DepositTopUpFormState implements DepositTopUpFormState {
  const factory _DepositTopUpFormState(
          {required final RequestState state,
          required final String message,
          required final bool isSubmit,
          required final String deposit,
          required final DepositDetail? depositDetail}) =
      _$DepositTopUpFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  String get deposit;
  @override
  DepositDetail? get depositDetail;
  @override
  @JsonKey(ignore: true)
  _$$DepositTopUpFormStateImplCopyWith<_$DepositTopUpFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
