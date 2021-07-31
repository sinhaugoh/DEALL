// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  Empty empty() {
    return const Empty();
  }

  InvalidEmail invalidEmail() {
    return const InvalidEmail();
  }

  InvalidPassword invalidPassword() {
    return const InvalidPassword();
  }

  IncorrectLength incorrectLength(int length) {
    return IncorrectLength(
      length,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function(int length) incorrectLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function(int length)? incorrectLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
    required TResult Function(IncorrectLength value) incorrectLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    TResult Function(IncorrectLength value)? incorrectLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<$Res> {
  factory $ValueFailureCopyWith(
          ValueFailure value, $Res Function(ValueFailure) then) =
      _$ValueFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<$Res> implements $ValueFailureCopyWith<$Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure _value;
  // ignore: unused_field
  final $Res Function(ValueFailure) _then;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

/// @nodoc

class _$Empty extends Empty {
  const _$Empty() : super._();

  @override
  String toString() {
    return 'ValueFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function(int length) incorrectLength,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function(int length)? incorrectLength,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
    required TResult Function(IncorrectLength value) incorrectLength,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    TResult Function(IncorrectLength value)? incorrectLength,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty extends ValueFailure {
  const factory Empty() = _$Empty;
  const Empty._() : super._();
}

/// @nodoc
abstract class $InvalidEmailCopyWith<$Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail value, $Res Function(InvalidEmail) then) =
      _$InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $InvalidEmailCopyWith<$Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail _value, $Res Function(InvalidEmail) _then)
      : super(_value, (v) => _then(v as InvalidEmail));

  @override
  InvalidEmail get _value => super._value as InvalidEmail;
}

/// @nodoc

class _$InvalidEmail extends InvalidEmail {
  const _$InvalidEmail() : super._();

  @override
  String toString() {
    return 'ValueFailure.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function(int length) incorrectLength,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function(int length)? incorrectLength,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
    required TResult Function(IncorrectLength value) incorrectLength,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    TResult Function(IncorrectLength value)? incorrectLength,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail extends ValueFailure {
  const factory InvalidEmail() = _$InvalidEmail;
  const InvalidEmail._() : super._();
}

/// @nodoc
abstract class $InvalidPasswordCopyWith<$Res> {
  factory $InvalidPasswordCopyWith(
          InvalidPassword value, $Res Function(InvalidPassword) then) =
      _$InvalidPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidPasswordCopyWithImpl<$Res>
    extends _$ValueFailureCopyWithImpl<$Res>
    implements $InvalidPasswordCopyWith<$Res> {
  _$InvalidPasswordCopyWithImpl(
      InvalidPassword _value, $Res Function(InvalidPassword) _then)
      : super(_value, (v) => _then(v as InvalidPassword));

  @override
  InvalidPassword get _value => super._value as InvalidPassword;
}

/// @nodoc

class _$InvalidPassword extends InvalidPassword {
  const _$InvalidPassword() : super._();

  @override
  String toString() {
    return 'ValueFailure.invalidPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function(int length) incorrectLength,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function(int length)? incorrectLength,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
    required TResult Function(IncorrectLength value) incorrectLength,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    TResult Function(IncorrectLength value)? incorrectLength,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword extends ValueFailure {
  const factory InvalidPassword() = _$InvalidPassword;
  const InvalidPassword._() : super._();
}

/// @nodoc
abstract class $IncorrectLengthCopyWith<$Res> {
  factory $IncorrectLengthCopyWith(
          IncorrectLength value, $Res Function(IncorrectLength) then) =
      _$IncorrectLengthCopyWithImpl<$Res>;
  $Res call({int length});
}

/// @nodoc
class _$IncorrectLengthCopyWithImpl<$Res>
    extends _$ValueFailureCopyWithImpl<$Res>
    implements $IncorrectLengthCopyWith<$Res> {
  _$IncorrectLengthCopyWithImpl(
      IncorrectLength _value, $Res Function(IncorrectLength) _then)
      : super(_value, (v) => _then(v as IncorrectLength));

  @override
  IncorrectLength get _value => super._value as IncorrectLength;

  @override
  $Res call({
    Object? length = freezed,
  }) {
    return _then(IncorrectLength(
      length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncorrectLength extends IncorrectLength {
  const _$IncorrectLength(this.length) : super._();

  @override
  final int length;

  @override
  String toString() {
    return 'ValueFailure.incorrectLength(length: $length)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IncorrectLength &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(length);

  @JsonKey(ignore: true)
  @override
  $IncorrectLengthCopyWith<IncorrectLength> get copyWith =>
      _$IncorrectLengthCopyWithImpl<IncorrectLength>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
    required TResult Function(int length) incorrectLength,
  }) {
    return incorrectLength(length);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    TResult Function(int length)? incorrectLength,
    required TResult orElse(),
  }) {
    if (incorrectLength != null) {
      return incorrectLength(length);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(InvalidPassword value) invalidPassword,
    required TResult Function(IncorrectLength value) incorrectLength,
  }) {
    return incorrectLength(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(InvalidPassword value)? invalidPassword,
    TResult Function(IncorrectLength value)? incorrectLength,
    required TResult orElse(),
  }) {
    if (incorrectLength != null) {
      return incorrectLength(this);
    }
    return orElse();
  }
}

abstract class IncorrectLength extends ValueFailure {
  const factory IncorrectLength(int length) = _$IncorrectLength;
  const IncorrectLength._() : super._();

  int get length => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncorrectLengthCopyWith<IncorrectLength> get copyWith =>
      throw _privateConstructorUsedError;
}
