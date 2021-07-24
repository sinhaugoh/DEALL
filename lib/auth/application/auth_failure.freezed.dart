// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  Server server(String errorMessage) {
    return Server(
      errorMessage,
    );
  }

  NoConnection noConnection() {
    return const NoConnection();
  }

  UnexpectedError unexpectedError(String errorMessage) {
    return UnexpectedError(
      errorMessage,
    );
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) server,
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? server,
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) then) =
      _$ServerCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$ServerCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(Server _value, $Res Function(Server) _then)
      : super(_value, (v) => _then(v as Server));

  @override
  Server get _value => super._value as Server;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(Server(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Server extends Server {
  const _$Server(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthFailure.server(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Server &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $ServerCopyWith<Server> get copyWith =>
      _$ServerCopyWithImpl<Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) server,
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpectedError,
  }) {
    return server(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? server,
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpectedError,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class Server extends AuthFailure {
  const factory Server(String errorMessage) = _$Server;
  const Server._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerCopyWith<Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoConnectionCopyWith<$Res> {
  factory $NoConnectionCopyWith(
          NoConnection value, $Res Function(NoConnection) then) =
      _$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
    return 'AuthFailure.noConnection()';
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
    required TResult Function(String errorMessage) server,
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpectedError,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? server,
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpectedError,
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
    required TResult Function(Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends AuthFailure {
  const factory NoConnection() = _$NoConnection;
  const NoConnection._() : super._();
}

/// @nodoc
abstract class $UnexpectedErrorCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(
          UnexpectedError value, $Res Function(UnexpectedError) then) =
      _$UnexpectedErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(
      UnexpectedError _value, $Res Function(UnexpectedError) _then)
      : super(_value, (v) => _then(v as UnexpectedError));

  @override
  UnexpectedError get _value => super._value as UnexpectedError;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(UnexpectedError(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedError extends UnexpectedError {
  const _$UnexpectedError(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthFailure.unexpectedError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnexpectedError &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $UnexpectedErrorCopyWith<UnexpectedError> get copyWith =>
      _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) server,
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) unexpectedError,
  }) {
    return unexpectedError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? server,
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError extends AuthFailure {
  const factory UnexpectedError(String errorMessage) = _$UnexpectedError;
  const UnexpectedError._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnexpectedErrorCopyWith<UnexpectedError> get copyWith =>
      throw _privateConstructorUsedError;
}
