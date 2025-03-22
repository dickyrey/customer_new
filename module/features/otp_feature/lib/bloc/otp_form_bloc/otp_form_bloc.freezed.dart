// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpFormEventCopyWith<$Res> {
  factory $OtpFormEventCopyWith(
          OtpFormEvent value, $Res Function(OtpFormEvent) then) =
      _$OtpFormEventCopyWithImpl<$Res, OtpFormEvent>;
}

/// @nodoc
class _$OtpFormEventCopyWithImpl<$Res, $Val extends OtpFormEvent>
    implements $OtpFormEventCopyWith<$Res> {
  _$OtpFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownController controller, String phoneNumber});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$OtpFormEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$InitImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CountdownController,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl({required this.controller, required this.phoneNumber});

  @override
  final CountdownController controller;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtpFormEvent.init(controller: $controller, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) {
    return init(controller, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) {
    return init?.call(controller, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(controller, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements OtpFormEvent {
  const factory _Init(
      {required final CountdownController controller,
      required final String phoneNumber}) = _$InitImpl;

  CountdownController get controller;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OTPNumberImplCopyWith<$Res> {
  factory _$$OTPNumberImplCopyWith(
          _$OTPNumberImpl value, $Res Function(_$OTPNumberImpl) then) =
      __$$OTPNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$OTPNumberImplCopyWithImpl<$Res>
    extends _$OtpFormEventCopyWithImpl<$Res, _$OTPNumberImpl>
    implements _$$OTPNumberImplCopyWith<$Res> {
  __$$OTPNumberImplCopyWithImpl(
      _$OTPNumberImpl _value, $Res Function(_$OTPNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$OTPNumberImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OTPNumberImpl implements _OTPNumber {
  const _$OTPNumberImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'OtpFormEvent.otpNumber(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPNumberImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPNumberImplCopyWith<_$OTPNumberImpl> get copyWith =>
      __$$OTPNumberImplCopyWithImpl<_$OTPNumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) {
    return otpNumber(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) {
    return otpNumber?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
    required TResult orElse(),
  }) {
    if (otpNumber != null) {
      return otpNumber(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) {
    return otpNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) {
    return otpNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) {
    if (otpNumber != null) {
      return otpNumber(this);
    }
    return orElse();
  }
}

abstract class _OTPNumber implements OtpFormEvent {
  const factory _OTPNumber(final String val) = _$OTPNumberImpl;

  String get val;
  @JsonKey(ignore: true)
  _$$OTPNumberImplCopyWith<_$OTPNumberImpl> get copyWith =>
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
    extends _$OtpFormEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl();

  @override
  String toString() {
    return 'OtpFormEvent.send()';
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
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
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
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements OtpFormEvent {
  const factory _Send() = _$SendImpl;
}

/// @nodoc
abstract class _$$StartTimerImplCopyWith<$Res> {
  factory _$$StartTimerImplCopyWith(
          _$StartTimerImpl value, $Res Function(_$StartTimerImpl) then) =
      __$$StartTimerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownController controller});
}

/// @nodoc
class __$$StartTimerImplCopyWithImpl<$Res>
    extends _$OtpFormEventCopyWithImpl<$Res, _$StartTimerImpl>
    implements _$$StartTimerImplCopyWith<$Res> {
  __$$StartTimerImplCopyWithImpl(
      _$StartTimerImpl _value, $Res Function(_$StartTimerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$StartTimerImpl(
      null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CountdownController,
    ));
  }
}

/// @nodoc

class _$StartTimerImpl implements _StartTimer {
  const _$StartTimerImpl(this.controller);

  @override
  final CountdownController controller;

  @override
  String toString() {
    return 'OtpFormEvent.startTimer(controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTimerImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTimerImplCopyWith<_$StartTimerImpl> get copyWith =>
      __$$StartTimerImplCopyWithImpl<_$StartTimerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) {
    return startTimer(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) {
    return startTimer?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class _StartTimer implements OtpFormEvent {
  const factory _StartTimer(final CountdownController controller) =
      _$StartTimerImpl;

  CountdownController get controller;
  @JsonKey(ignore: true)
  _$$StartTimerImplCopyWith<_$StartTimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnTimerFinishImplCopyWith<$Res> {
  factory _$$OnTimerFinishImplCopyWith(
          _$OnTimerFinishImpl value, $Res Function(_$OnTimerFinishImpl) then) =
      __$$OnTimerFinishImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnTimerFinishImplCopyWithImpl<$Res>
    extends _$OtpFormEventCopyWithImpl<$Res, _$OnTimerFinishImpl>
    implements _$$OnTimerFinishImplCopyWith<$Res> {
  __$$OnTimerFinishImplCopyWithImpl(
      _$OnTimerFinishImpl _value, $Res Function(_$OnTimerFinishImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnTimerFinishImpl implements _OnTimerFinish {
  const _$OnTimerFinishImpl();

  @override
  String toString() {
    return 'OtpFormEvent.onTimerFinish()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnTimerFinishImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CountdownController controller, String phoneNumber)
        init,
    required TResult Function(String val) otpNumber,
    required TResult Function() send,
    required TResult Function(CountdownController controller) startTimer,
    required TResult Function() onTimerFinish,
  }) {
    return onTimerFinish();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CountdownController controller, String phoneNumber)? init,
    TResult? Function(String val)? otpNumber,
    TResult? Function()? send,
    TResult? Function(CountdownController controller)? startTimer,
    TResult? Function()? onTimerFinish,
  }) {
    return onTimerFinish?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountdownController controller, String phoneNumber)? init,
    TResult Function(String val)? otpNumber,
    TResult Function()? send,
    TResult Function(CountdownController controller)? startTimer,
    TResult Function()? onTimerFinish,
    required TResult orElse(),
  }) {
    if (onTimerFinish != null) {
      return onTimerFinish();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OTPNumber value) otpNumber,
    required TResult Function(_Send value) send,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_OnTimerFinish value) onTimerFinish,
  }) {
    return onTimerFinish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_OTPNumber value)? otpNumber,
    TResult? Function(_Send value)? send,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_OnTimerFinish value)? onTimerFinish,
  }) {
    return onTimerFinish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OTPNumber value)? otpNumber,
    TResult Function(_Send value)? send,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_OnTimerFinish value)? onTimerFinish,
    required TResult orElse(),
  }) {
    if (onTimerFinish != null) {
      return onTimerFinish(this);
    }
    return orElse();
  }
}

abstract class _OnTimerFinish implements OtpFormEvent {
  const factory _OnTimerFinish() = _$OnTimerFinishImpl;
}

/// @nodoc
mixin _$OtpFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isTimeoutDone => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String get otpNumber => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpFormStateCopyWith<OtpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpFormStateCopyWith<$Res> {
  factory $OtpFormStateCopyWith(
          OtpFormState value, $Res Function(OtpFormState) then) =
      _$OtpFormStateCopyWithImpl<$Res, OtpFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isTimeoutDone,
      int time,
      String otpNumber,
      String phoneNumber});
}

/// @nodoc
class _$OtpFormStateCopyWithImpl<$Res, $Val extends OtpFormState>
    implements $OtpFormStateCopyWith<$Res> {
  _$OtpFormStateCopyWithImpl(this._value, this._then);

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
    Object? isTimeoutDone = null,
    Object? time = null,
    Object? otpNumber = null,
    Object? phoneNumber = null,
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
      isTimeoutDone: null == isTimeoutDone
          ? _value.isTimeoutDone
          : isTimeoutDone // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      otpNumber: null == otpNumber
          ? _value.otpNumber
          : otpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpFormStateImplCopyWith<$Res>
    implements $OtpFormStateCopyWith<$Res> {
  factory _$$OtpFormStateImplCopyWith(
          _$OtpFormStateImpl value, $Res Function(_$OtpFormStateImpl) then) =
      __$$OtpFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      bool isSubmit,
      bool isTimeoutDone,
      int time,
      String otpNumber,
      String phoneNumber});
}

/// @nodoc
class __$$OtpFormStateImplCopyWithImpl<$Res>
    extends _$OtpFormStateCopyWithImpl<$Res, _$OtpFormStateImpl>
    implements _$$OtpFormStateImplCopyWith<$Res> {
  __$$OtpFormStateImplCopyWithImpl(
      _$OtpFormStateImpl _value, $Res Function(_$OtpFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isTimeoutDone = null,
    Object? time = null,
    Object? otpNumber = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$OtpFormStateImpl(
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
      isTimeoutDone: null == isTimeoutDone
          ? _value.isTimeoutDone
          : isTimeoutDone // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      otpNumber: null == otpNumber
          ? _value.otpNumber
          : otpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpFormStateImpl implements _OtpFormState {
  const _$OtpFormStateImpl(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isTimeoutDone,
      required this.time,
      required this.otpNumber,
      required this.phoneNumber});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isTimeoutDone;
  @override
  final int time;
  @override
  final String otpNumber;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'OtpFormState(state: $state, message: $message, isSubmit: $isSubmit, isTimeoutDone: $isTimeoutDone, time: $time, otpNumber: $otpNumber, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpFormStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isTimeoutDone, isTimeoutDone) ||
                other.isTimeoutDone == isTimeoutDone) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.otpNumber, otpNumber) ||
                other.otpNumber == otpNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, isSubmit,
      isTimeoutDone, time, otpNumber, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpFormStateImplCopyWith<_$OtpFormStateImpl> get copyWith =>
      __$$OtpFormStateImplCopyWithImpl<_$OtpFormStateImpl>(this, _$identity);
}

abstract class _OtpFormState implements OtpFormState {
  const factory _OtpFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isTimeoutDone,
      required final int time,
      required final String otpNumber,
      required final String phoneNumber}) = _$OtpFormStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isTimeoutDone;
  @override
  int get time;
  @override
  String get otpNumber;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$OtpFormStateImplCopyWith<_$OtpFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
