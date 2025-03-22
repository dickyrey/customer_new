// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) phoneNumber,
    required TResult Function(bool v) checkbox,
    required TResult Function() signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? phoneNumber,
    TResult? Function(bool v)? checkbox,
    TResult? Function()? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? phoneNumber,
    TResult Function(bool v)? checkbox,
    TResult Function()? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumber value) phoneNumber,
    required TResult Function(_Checkbox value) checkbox,
    required TResult Function(_SignIn value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneNumber value)? phoneNumber,
    TResult? Function(_Checkbox value)? checkbox,
    TResult? Function(_SignIn value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumber value)? phoneNumber,
    TResult Function(_Checkbox value)? checkbox,
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninFormEventCopyWith<$Res> {
  factory $SigninFormEventCopyWith(
          SigninFormEvent value, $Res Function(SigninFormEvent) then) =
      _$SigninFormEventCopyWithImpl<$Res, SigninFormEvent>;
}

/// @nodoc
class _$SigninFormEventCopyWithImpl<$Res, $Val extends SigninFormEvent>
    implements $SigninFormEventCopyWith<$Res> {
  _$SigninFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PhoneNumberImplCopyWith<$Res> {
  factory _$$PhoneNumberImplCopyWith(
          _$PhoneNumberImpl value, $Res Function(_$PhoneNumberImpl) then) =
      __$$PhoneNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String v});
}

/// @nodoc
class __$$PhoneNumberImplCopyWithImpl<$Res>
    extends _$SigninFormEventCopyWithImpl<$Res, _$PhoneNumberImpl>
    implements _$$PhoneNumberImplCopyWith<$Res> {
  __$$PhoneNumberImplCopyWithImpl(
      _$PhoneNumberImpl _value, $Res Function(_$PhoneNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$PhoneNumberImpl(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberImpl implements _PhoneNumber {
  const _$PhoneNumberImpl(this.v);

  @override
  final String v;

  @override
  String toString() {
    return 'SigninFormEvent.phoneNumber(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberImplCopyWith<_$PhoneNumberImpl> get copyWith =>
      __$$PhoneNumberImplCopyWithImpl<_$PhoneNumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) phoneNumber,
    required TResult Function(bool v) checkbox,
    required TResult Function() signIn,
  }) {
    return phoneNumber(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? phoneNumber,
    TResult? Function(bool v)? checkbox,
    TResult? Function()? signIn,
  }) {
    return phoneNumber?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? phoneNumber,
    TResult Function(bool v)? checkbox,
    TResult Function()? signIn,
    required TResult orElse(),
  }) {
    if (phoneNumber != null) {
      return phoneNumber(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumber value) phoneNumber,
    required TResult Function(_Checkbox value) checkbox,
    required TResult Function(_SignIn value) signIn,
  }) {
    return phoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneNumber value)? phoneNumber,
    TResult? Function(_Checkbox value)? checkbox,
    TResult? Function(_SignIn value)? signIn,
  }) {
    return phoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumber value)? phoneNumber,
    TResult Function(_Checkbox value)? checkbox,
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (phoneNumber != null) {
      return phoneNumber(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumber implements SigninFormEvent {
  const factory _PhoneNumber(final String v) = _$PhoneNumberImpl;

  String get v;
  @JsonKey(ignore: true)
  _$$PhoneNumberImplCopyWith<_$PhoneNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckboxImplCopyWith<$Res> {
  factory _$$CheckboxImplCopyWith(
          _$CheckboxImpl value, $Res Function(_$CheckboxImpl) then) =
      __$$CheckboxImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool v});
}

/// @nodoc
class __$$CheckboxImplCopyWithImpl<$Res>
    extends _$SigninFormEventCopyWithImpl<$Res, _$CheckboxImpl>
    implements _$$CheckboxImplCopyWith<$Res> {
  __$$CheckboxImplCopyWithImpl(
      _$CheckboxImpl _value, $Res Function(_$CheckboxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$CheckboxImpl(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckboxImpl implements _Checkbox {
  const _$CheckboxImpl({required this.v});

  @override
  final bool v;

  @override
  String toString() {
    return 'SigninFormEvent.checkbox(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckboxImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckboxImplCopyWith<_$CheckboxImpl> get copyWith =>
      __$$CheckboxImplCopyWithImpl<_$CheckboxImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) phoneNumber,
    required TResult Function(bool v) checkbox,
    required TResult Function() signIn,
  }) {
    return checkbox(v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? phoneNumber,
    TResult? Function(bool v)? checkbox,
    TResult? Function()? signIn,
  }) {
    return checkbox?.call(v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? phoneNumber,
    TResult Function(bool v)? checkbox,
    TResult Function()? signIn,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumber value) phoneNumber,
    required TResult Function(_Checkbox value) checkbox,
    required TResult Function(_SignIn value) signIn,
  }) {
    return checkbox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneNumber value)? phoneNumber,
    TResult? Function(_Checkbox value)? checkbox,
    TResult? Function(_SignIn value)? signIn,
  }) {
    return checkbox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumber value)? phoneNumber,
    TResult Function(_Checkbox value)? checkbox,
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(this);
    }
    return orElse();
  }
}

abstract class _Checkbox implements SigninFormEvent {
  const factory _Checkbox({required final bool v}) = _$CheckboxImpl;

  bool get v;
  @JsonKey(ignore: true)
  _$$CheckboxImplCopyWith<_$CheckboxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInImplCopyWith<$Res> {
  factory _$$SignInImplCopyWith(
          _$SignInImpl value, $Res Function(_$SignInImpl) then) =
      __$$SignInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInImplCopyWithImpl<$Res>
    extends _$SigninFormEventCopyWithImpl<$Res, _$SignInImpl>
    implements _$$SignInImplCopyWith<$Res> {
  __$$SignInImplCopyWithImpl(
      _$SignInImpl _value, $Res Function(_$SignInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInImpl implements _SignIn {
  const _$SignInImpl();

  @override
  String toString() {
    return 'SigninFormEvent.signIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String v) phoneNumber,
    required TResult Function(bool v) checkbox,
    required TResult Function() signIn,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String v)? phoneNumber,
    TResult? Function(bool v)? checkbox,
    TResult? Function()? signIn,
  }) {
    return signIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String v)? phoneNumber,
    TResult Function(bool v)? checkbox,
    TResult Function()? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumber value) phoneNumber,
    required TResult Function(_Checkbox value) checkbox,
    required TResult Function(_SignIn value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneNumber value)? phoneNumber,
    TResult? Function(_Checkbox value)? checkbox,
    TResult? Function(_SignIn value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumber value)? phoneNumber,
    TResult Function(_Checkbox value)? checkbox,
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements SigninFormEvent {
  const factory _SignIn() = _$SignInImpl;
}

/// @nodoc
mixin _$SigninFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isAcceptPrivacyPolicy => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get formattedPhoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigninFormStateCopyWith<SigninFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninFormStateCopyWith<$Res> {
  factory $SigninFormStateCopyWith(
          SigninFormState value, $Res Function(SigninFormState) then) =
      _$SigninFormStateCopyWithImpl<$Res, SigninFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isAcceptPrivacyPolicy,
      String phoneNumber,
      String formattedPhoneNumber});
}

/// @nodoc
class _$SigninFormStateCopyWithImpl<$Res, $Val extends SigninFormState>
    implements $SigninFormStateCopyWith<$Res> {
  _$SigninFormStateCopyWithImpl(this._value, this._then);

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
    Object? isAcceptPrivacyPolicy = null,
    Object? phoneNumber = null,
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
      isAcceptPrivacyPolicy: null == isAcceptPrivacyPolicy
          ? _value.isAcceptPrivacyPolicy
          : isAcceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SigninFormStateImplCopyWith<$Res>
    implements $SigninFormStateCopyWith<$Res> {
  factory _$$SigninFormStateImplCopyWith(_$SigninFormStateImpl value,
          $Res Function(_$SigninFormStateImpl) then) =
      __$$SigninFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isAcceptPrivacyPolicy,
      String phoneNumber,
      String formattedPhoneNumber});
}

/// @nodoc
class __$$SigninFormStateImplCopyWithImpl<$Res>
    extends _$SigninFormStateCopyWithImpl<$Res, _$SigninFormStateImpl>
    implements _$$SigninFormStateImplCopyWith<$Res> {
  __$$SigninFormStateImplCopyWithImpl(
      _$SigninFormStateImpl _value, $Res Function(_$SigninFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isAcceptPrivacyPolicy = null,
    Object? phoneNumber = null,
    Object? formattedPhoneNumber = null,
  }) {
    return _then(_$SigninFormStateImpl(
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
      isAcceptPrivacyPolicy: null == isAcceptPrivacyPolicy
          ? _value.isAcceptPrivacyPolicy
          : isAcceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SigninFormStateImpl implements _SigninFormState {
  const _$SigninFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isAcceptPrivacyPolicy,
      required this.phoneNumber,
      required this.formattedPhoneNumber});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isAcceptPrivacyPolicy;
  @override
  final String phoneNumber;
  @override
  final String formattedPhoneNumber;

  @override
  String toString() {
    return 'SigninFormState(state: $state, message: $message, isSubmit: $isSubmit, isAcceptPrivacyPolicy: $isAcceptPrivacyPolicy, phoneNumber: $phoneNumber, formattedPhoneNumber: $formattedPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isAcceptPrivacyPolicy, isAcceptPrivacyPolicy) ||
                other.isAcceptPrivacyPolicy == isAcceptPrivacyPolicy) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, isSubmit,
      isAcceptPrivacyPolicy, phoneNumber, formattedPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninFormStateImplCopyWith<_$SigninFormStateImpl> get copyWith =>
      __$$SigninFormStateImplCopyWithImpl<_$SigninFormStateImpl>(
          this, _$identity);
}

abstract class _SigninFormState implements SigninFormState {
  const factory _SigninFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isAcceptPrivacyPolicy,
      required final String phoneNumber,
      required final String formattedPhoneNumber}) = _$SigninFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isAcceptPrivacyPolicy;
  @override
  String get phoneNumber;
  @override
  String get formattedPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$SigninFormStateImplCopyWith<_$SigninFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
