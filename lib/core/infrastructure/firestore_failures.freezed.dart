// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'firestore_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FirestoreFailuresTearOff {
  const _$FirestoreFailuresTearOff();

  CancelledOperation cancelledOperation() {
    return const CancelledOperation();
  }

  ObjectNotFound objectNotFound() {
    return const ObjectNotFound();
  }

  ResourceExhausted resourceExhausted() {
    return const ResourceExhausted();
  }

  ServiceUnavailable serviceUnavailable() {
    return const ServiceUnavailable();
  }

  Unknown unknown() {
    return const Unknown();
  }

  NoConnection noConnection() {
    return const NoConnection();
  }
}

/// @nodoc
const $FirestoreFailures = _$FirestoreFailuresTearOff();

/// @nodoc
mixin _$FirestoreFailures {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreFailuresCopyWith<$Res> {
  factory $FirestoreFailuresCopyWith(
          FirestoreFailures value, $Res Function(FirestoreFailures) then) =
      _$FirestoreFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirestoreFailuresCopyWithImpl<$Res>
    implements $FirestoreFailuresCopyWith<$Res> {
  _$FirestoreFailuresCopyWithImpl(this._value, this._then);

  final FirestoreFailures _value;
  // ignore: unused_field
  final $Res Function(FirestoreFailures) _then;
}

/// @nodoc
abstract class $CancelledOperationCopyWith<$Res> {
  factory $CancelledOperationCopyWith(
          CancelledOperation value, $Res Function(CancelledOperation) then) =
      _$CancelledOperationCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelledOperationCopyWithImpl<$Res>
    extends _$FirestoreFailuresCopyWithImpl<$Res>
    implements $CancelledOperationCopyWith<$Res> {
  _$CancelledOperationCopyWithImpl(
      CancelledOperation _value, $Res Function(CancelledOperation) _then)
      : super(_value, (v) => _then(v as CancelledOperation));

  @override
  CancelledOperation get _value => super._value as CancelledOperation;
}

/// @nodoc

class _$CancelledOperation extends CancelledOperation {
  const _$CancelledOperation() : super._();

  @override
  String toString() {
    return 'FirestoreFailures.cancelledOperation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelledOperation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return cancelledOperation();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (cancelledOperation != null) {
      return cancelledOperation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return cancelledOperation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (cancelledOperation != null) {
      return cancelledOperation(this);
    }
    return orElse();
  }
}

abstract class CancelledOperation extends FirestoreFailures {
  const factory CancelledOperation() = _$CancelledOperation;
  const CancelledOperation._() : super._();
}

/// @nodoc
abstract class $ObjectNotFoundCopyWith<$Res> {
  factory $ObjectNotFoundCopyWith(
          ObjectNotFound value, $Res Function(ObjectNotFound) then) =
      _$ObjectNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$ObjectNotFoundCopyWithImpl<$Res>
    extends _$FirestoreFailuresCopyWithImpl<$Res>
    implements $ObjectNotFoundCopyWith<$Res> {
  _$ObjectNotFoundCopyWithImpl(
      ObjectNotFound _value, $Res Function(ObjectNotFound) _then)
      : super(_value, (v) => _then(v as ObjectNotFound));

  @override
  ObjectNotFound get _value => super._value as ObjectNotFound;
}

/// @nodoc

class _$ObjectNotFound extends ObjectNotFound {
  const _$ObjectNotFound() : super._();

  @override
  String toString() {
    return 'FirestoreFailures.objectNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ObjectNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return objectNotFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (objectNotFound != null) {
      return objectNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return objectNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (objectNotFound != null) {
      return objectNotFound(this);
    }
    return orElse();
  }
}

abstract class ObjectNotFound extends FirestoreFailures {
  const factory ObjectNotFound() = _$ObjectNotFound;
  const ObjectNotFound._() : super._();
}

/// @nodoc
abstract class $ResourceExhaustedCopyWith<$Res> {
  factory $ResourceExhaustedCopyWith(
          ResourceExhausted value, $Res Function(ResourceExhausted) then) =
      _$ResourceExhaustedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResourceExhaustedCopyWithImpl<$Res>
    extends _$FirestoreFailuresCopyWithImpl<$Res>
    implements $ResourceExhaustedCopyWith<$Res> {
  _$ResourceExhaustedCopyWithImpl(
      ResourceExhausted _value, $Res Function(ResourceExhausted) _then)
      : super(_value, (v) => _then(v as ResourceExhausted));

  @override
  ResourceExhausted get _value => super._value as ResourceExhausted;
}

/// @nodoc

class _$ResourceExhausted extends ResourceExhausted {
  const _$ResourceExhausted() : super._();

  @override
  String toString() {
    return 'FirestoreFailures.resourceExhausted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResourceExhausted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return resourceExhausted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (resourceExhausted != null) {
      return resourceExhausted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return resourceExhausted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (resourceExhausted != null) {
      return resourceExhausted(this);
    }
    return orElse();
  }
}

abstract class ResourceExhausted extends FirestoreFailures {
  const factory ResourceExhausted() = _$ResourceExhausted;
  const ResourceExhausted._() : super._();
}

/// @nodoc
abstract class $ServiceUnavailableCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(
          ServiceUnavailable value, $Res Function(ServiceUnavailable) then) =
      _$ServiceUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    extends _$FirestoreFailuresCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(
      ServiceUnavailable _value, $Res Function(ServiceUnavailable) _then)
      : super(_value, (v) => _then(v as ServiceUnavailable));

  @override
  ServiceUnavailable get _value => super._value as ServiceUnavailable;
}

/// @nodoc

class _$ServiceUnavailable extends ServiceUnavailable {
  const _$ServiceUnavailable() : super._();

  @override
  String toString() {
    return 'FirestoreFailures.serviceUnavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServiceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return serviceUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class ServiceUnavailable extends FirestoreFailures {
  const factory ServiceUnavailable() = _$ServiceUnavailable;
  const ServiceUnavailable._() : super._();
}

/// @nodoc
abstract class $UnknownCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) then) =
      _$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnknownCopyWithImpl<$Res> extends _$FirestoreFailuresCopyWithImpl<$Res>
    implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(Unknown _value, $Res Function(Unknown) _then)
      : super(_value, (v) => _then(v as Unknown));

  @override
  Unknown get _value => super._value as Unknown;
}

/// @nodoc

class _$Unknown extends Unknown {
  const _$Unknown() : super._();

  @override
  String toString() {
    return 'FirestoreFailures.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown extends FirestoreFailures {
  const factory Unknown() = _$Unknown;
  const Unknown._() : super._();
}

/// @nodoc
abstract class $NoConnectionCopyWith<$Res> {
  factory $NoConnectionCopyWith(
          NoConnection value, $Res Function(NoConnection) then) =
      _$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionCopyWithImpl<$Res>
    extends _$FirestoreFailuresCopyWithImpl<$Res>
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
    return 'FirestoreFailures.noConnection()';
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
    required TResult Function() cancelledOperation,
    required TResult Function() objectNotFound,
    required TResult Function() resourceExhausted,
    required TResult Function() serviceUnavailable,
    required TResult Function() unknown,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledOperation,
    TResult Function()? objectNotFound,
    TResult Function()? resourceExhausted,
    TResult Function()? serviceUnavailable,
    TResult Function()? unknown,
    TResult Function()? noConnection,
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
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(ResourceExhausted value) resourceExhausted,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(Unknown value) unknown,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(ResourceExhausted value)? resourceExhausted,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(Unknown value)? unknown,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends FirestoreFailures {
  const factory NoConnection() = _$NoConnection;
  const NoConnection._() : super._();
}
