// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'image_picking_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImagePickingFailureTearOff {
  const _$ImagePickingFailureTearOff();

  NoConnection noConnection() {
    return const NoConnection();
  }

  ImagePicker imagePicker(String errorMessage) {
    return ImagePicker(
      errorMessage,
    );
  }

  Server server(String errorMessage) {
    return Server(
      errorMessage,
    );
  }
}

/// @nodoc
const $ImagePickingFailure = _$ImagePickingFailureTearOff();

/// @nodoc
mixin _$ImagePickingFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) imagePicker,
    required TResult Function(String errorMessage) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? imagePicker,
    TResult Function(String errorMessage)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(ImagePicker value) imagePicker,
    required TResult Function(Server value) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(ImagePicker value)? imagePicker,
    TResult Function(Server value)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickingFailureCopyWith<$Res> {
  factory $ImagePickingFailureCopyWith(
          ImagePickingFailure value, $Res Function(ImagePickingFailure) then) =
      _$ImagePickingFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImagePickingFailureCopyWithImpl<$Res>
    implements $ImagePickingFailureCopyWith<$Res> {
  _$ImagePickingFailureCopyWithImpl(this._value, this._then);

  final ImagePickingFailure _value;
  // ignore: unused_field
  final $Res Function(ImagePickingFailure) _then;
}

/// @nodoc
abstract class $NoConnectionCopyWith<$Res> {
  factory $NoConnectionCopyWith(
          NoConnection value, $Res Function(NoConnection) then) =
      _$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionCopyWithImpl<$Res>
    extends _$ImagePickingFailureCopyWithImpl<$Res>
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
    return 'ImagePickingFailure.noConnection()';
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
    required TResult Function(String errorMessage) imagePicker,
    required TResult Function(String errorMessage) server,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? imagePicker,
    TResult Function(String errorMessage)? server,
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
    required TResult Function(ImagePicker value) imagePicker,
    required TResult Function(Server value) server,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(ImagePicker value)? imagePicker,
    TResult Function(Server value)? server,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends ImagePickingFailure {
  const factory NoConnection() = _$NoConnection;
  const NoConnection._() : super._();
}

/// @nodoc
abstract class $ImagePickerCopyWith<$Res> {
  factory $ImagePickerCopyWith(
          ImagePicker value, $Res Function(ImagePicker) then) =
      _$ImagePickerCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$ImagePickerCopyWithImpl<$Res>
    extends _$ImagePickingFailureCopyWithImpl<$Res>
    implements $ImagePickerCopyWith<$Res> {
  _$ImagePickerCopyWithImpl(
      ImagePicker _value, $Res Function(ImagePicker) _then)
      : super(_value, (v) => _then(v as ImagePicker));

  @override
  ImagePicker get _value => super._value as ImagePicker;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(ImagePicker(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImagePicker extends ImagePicker {
  const _$ImagePicker(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ImagePickingFailure.imagePicker(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImagePicker &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $ImagePickerCopyWith<ImagePicker> get copyWith =>
      _$ImagePickerCopyWithImpl<ImagePicker>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) imagePicker,
    required TResult Function(String errorMessage) server,
  }) {
    return imagePicker(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? imagePicker,
    TResult Function(String errorMessage)? server,
    required TResult orElse(),
  }) {
    if (imagePicker != null) {
      return imagePicker(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(ImagePicker value) imagePicker,
    required TResult Function(Server value) server,
  }) {
    return imagePicker(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(ImagePicker value)? imagePicker,
    TResult Function(Server value)? server,
    required TResult orElse(),
  }) {
    if (imagePicker != null) {
      return imagePicker(this);
    }
    return orElse();
  }
}

abstract class ImagePicker extends ImagePickingFailure {
  const factory ImagePicker(String errorMessage) = _$ImagePicker;
  const ImagePicker._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePickerCopyWith<ImagePicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) then) =
      _$ServerCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$ServerCopyWithImpl<$Res> extends _$ImagePickingFailureCopyWithImpl<$Res>
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
    return 'ImagePickingFailure.server(errorMessage: $errorMessage)';
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
    required TResult Function() noConnection,
    required TResult Function(String errorMessage) imagePicker,
    required TResult Function(String errorMessage) server,
  }) {
    return server(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(String errorMessage)? imagePicker,
    TResult Function(String errorMessage)? server,
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
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(ImagePicker value) imagePicker,
    required TResult Function(Server value) server,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(ImagePicker value)? imagePicker,
    TResult Function(Server value)? server,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class Server extends ImagePickingFailure {
  const factory Server(String errorMessage) = _$Server;
  const Server._() : super._();

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerCopyWith<Server> get copyWith => throw _privateConstructorUsedError;
}
