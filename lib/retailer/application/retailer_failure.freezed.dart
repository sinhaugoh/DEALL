// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'retailer_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RetailerFailureTearOff {
  const _$RetailerFailureTearOff();

  NoConnection noConnection() {
    return const NoConnection();
  }

  Unexpected unexpected(String errorMessage) {
    return Unexpected(
      errorMessage,
    );
  }

  NotFound notFound() {
    return const NotFound();
  }

  Authentication authentication(String errorMessage) {
    return Authentication(
      errorMessage,
    );
  }
}

/// @nodoc
const $RetailerFailure = _$RetailerFailureTearOff();

/// @nodoc
mixin _$RetailerFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
    required TResult Function(String errorMessage) authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    TResult Function(String errorMessage)? authentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Authentication value) authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Authentication value)? authentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailerFailureCopyWith<$Res> {
  factory $RetailerFailureCopyWith(
          RetailerFailure value, $Res Function(RetailerFailure) then) =
      _$RetailerFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetailerFailureCopyWithImpl<$Res>
    implements $RetailerFailureCopyWith<$Res> {
  _$RetailerFailureCopyWithImpl(this._value, this._then);

  final RetailerFailure _value;
  // ignore: unused_field
  final $Res Function(RetailerFailure) _then;
}

/// @nodoc
abstract class $NoConnectionCopyWith<$Res> {
  factory $NoConnectionCopyWith(
          NoConnection value, $Res Function(NoConnection) then) =
      _$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionCopyWithImpl<$Res>
    extends _$RetailerFailureCopyWithImpl<$Res>
    implements $NoConnectionCopyWith<$Res> {
  _$NoConnectionCopyWithImpl(
      NoConnection _value, $Res Function(NoConnection) _then)
      : super(_value, (v) => _then(v as NoConnection));

  @override
  NoConnection get _value => super._value as NoConnection;
}

/// @nodoc

class _$NoConnection extends NoConnection {
  const _$NoConnection() : super._();

  @override
  String toString() {
    return 'RetailerFailure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
    required TResult Function(String errorMessage) authentication,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    TResult Function(String errorMessage)? authentication,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Authentication value) authentication,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Authentication value)? authentication,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends RetailerFailure {
  const factory NoConnection() = _$NoConnection;
  const NoConnection._() : super._();
}

/// @nodoc
abstract class $UnexpectedCopyWith<$Res> {
  factory $UnexpectedCopyWith(
          Unexpected value, $Res Function(Unexpected) then) =
      _$UnexpectedCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$UnexpectedCopyWithImpl<$Res> extends _$RetailerFailureCopyWithImpl<$Res>
    implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(Unexpected _value, $Res Function(Unexpected) _then)
      : super(_value, (v) => _then(v as Unexpected));

  @override
  Unexpected get _value => super._value as Unexpected;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(Unexpected(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unexpected extends Unexpected {
  const _$Unexpected(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RetailerFailure.unexpected(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unexpected &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $UnexpectedCopyWith<Unexpected> get copyWith =>
      _$UnexpectedCopyWithImpl<Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
    required TResult Function(String errorMessage) authentication,
  }) {
    return unexpected(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    TResult Function(String errorMessage)? authentication,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Authentication value) authentication,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Authentication value)? authentication,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected extends RetailerFailure {
  const factory Unexpected(String errorMessage) = _$Unexpected;
  const Unexpected._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnexpectedCopyWith<Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotFoundCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) then) =
      _$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotFoundCopyWithImpl<$Res> extends _$RetailerFailureCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(NotFound _value, $Res Function(NotFound) _then)
      : super(_value, (v) => _then(v as NotFound));

  @override
  NotFound get _value => super._value as NotFound;
}

/// @nodoc

class _$NotFound extends NotFound {
  const _$NotFound() : super._();

  @override
  String toString() {
    return 'RetailerFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
    required TResult Function(String errorMessage) authentication,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    TResult Function(String errorMessage)? authentication,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Authentication value) authentication,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Authentication value)? authentication,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound extends RetailerFailure {
  const factory NotFound() = _$NotFound;
  const NotFound._() : super._();
}

/// @nodoc
abstract class $AuthenticationCopyWith<$Res> {
  factory $AuthenticationCopyWith(
          Authentication value, $Res Function(Authentication) then) =
      _$AuthenticationCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$AuthenticationCopyWithImpl<$Res>
    extends _$RetailerFailureCopyWithImpl<$Res>
    implements $AuthenticationCopyWith<$Res> {
  _$AuthenticationCopyWithImpl(
      Authentication _value, $Res Function(Authentication) _then)
      : super(_value, (v) => _then(v as Authentication));

  @override
  Authentication get _value => super._value as Authentication;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(Authentication(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Authentication extends Authentication {
  const _$Authentication(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RetailerFailure.authentication(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authentication &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $AuthenticationCopyWith<Authentication> get copyWith =>
      _$AuthenticationCopyWithImpl<Authentication>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
    required TResult Function(String errorMessage) authentication,
  }) {
    return authentication(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    TResult Function(String errorMessage)? authentication,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Authentication value) authentication,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    TResult Function(Authentication value)? authentication,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class Authentication extends RetailerFailure {
  const factory Authentication(String errorMessage) = _$Authentication;
  const Authentication._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationCopyWith<Authentication> get copyWith =>
      throw _privateConstructorUsedError;
}
