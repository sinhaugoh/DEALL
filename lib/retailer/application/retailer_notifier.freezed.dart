// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'retailer_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RetailerNotifierStateTearOff {
  const _$RetailerNotifierStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Loading loading() {
    return const Loading();
  }

  Loaded loaded(Retailer retailer, {required bool hasConnection}) {
    return Loaded(
      retailer,
      hasConnection: hasConnection,
    );
  }

  Failure failure(RetailerFailure retailerFailure) {
    return Failure(
      retailerFailure,
    );
  }
}

/// @nodoc
const $RetailerNotifierState = _$RetailerNotifierStateTearOff();

/// @nodoc
mixin _$RetailerNotifierState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Retailer retailer, bool hasConnection) loaded,
    required TResult Function(RetailerFailure retailerFailure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Retailer retailer, bool hasConnection)? loaded,
    TResult Function(RetailerFailure retailerFailure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailerNotifierStateCopyWith<$Res> {
  factory $RetailerNotifierStateCopyWith(RetailerNotifierState value,
          $Res Function(RetailerNotifierState) then) =
      _$RetailerNotifierStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetailerNotifierStateCopyWithImpl<$Res>
    implements $RetailerNotifierStateCopyWith<$Res> {
  _$RetailerNotifierStateCopyWithImpl(this._value, this._then);

  final RetailerNotifierState _value;
  // ignore: unused_field
  final $Res Function(RetailerNotifierState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$RetailerNotifierStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial extends Initial {
  const _$Initial() : super._();

  @override
  String toString() {
    return 'RetailerNotifierState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Retailer retailer, bool hasConnection) loaded,
    required TResult Function(RetailerFailure retailerFailure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Retailer retailer, bool hasConnection)? loaded,
    TResult Function(RetailerFailure retailerFailure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends RetailerNotifierState {
  const factory Initial() = _$Initial;
  const Initial._() : super._();
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$RetailerNotifierStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading extends Loading {
  const _$Loading() : super._();

  @override
  String toString() {
    return 'RetailerNotifierState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Retailer retailer, bool hasConnection) loaded,
    required TResult Function(RetailerFailure retailerFailure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Retailer retailer, bool hasConnection)? loaded,
    TResult Function(RetailerFailure retailerFailure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends RetailerNotifierState {
  const factory Loading() = _$Loading;
  const Loading._() : super._();
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({Retailer retailer, bool hasConnection});

  $RetailerCopyWith<$Res> get retailer;
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    extends _$RetailerNotifierStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? retailer = freezed,
    Object? hasConnection = freezed,
  }) {
    return _then(Loaded(
      retailer == freezed
          ? _value.retailer
          : retailer // ignore: cast_nullable_to_non_nullable
              as Retailer,
      hasConnection: hasConnection == freezed
          ? _value.hasConnection
          : hasConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $RetailerCopyWith<$Res> get retailer {
    return $RetailerCopyWith<$Res>(_value.retailer, (value) {
      return _then(_value.copyWith(retailer: value));
    });
  }
}

/// @nodoc

class _$Loaded extends Loaded {
  const _$Loaded(this.retailer, {required this.hasConnection}) : super._();

  @override
  final Retailer retailer;
  @override
  final bool hasConnection;

  @override
  String toString() {
    return 'RetailerNotifierState.loaded(retailer: $retailer, hasConnection: $hasConnection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.retailer, retailer) ||
                const DeepCollectionEquality()
                    .equals(other.retailer, retailer)) &&
            (identical(other.hasConnection, hasConnection) ||
                const DeepCollectionEquality()
                    .equals(other.hasConnection, hasConnection)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(retailer) ^
      const DeepCollectionEquality().hash(hasConnection);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Retailer retailer, bool hasConnection) loaded,
    required TResult Function(RetailerFailure retailerFailure) failure,
  }) {
    return loaded(retailer, hasConnection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Retailer retailer, bool hasConnection)? loaded,
    TResult Function(RetailerFailure retailerFailure)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(retailer, hasConnection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded extends RetailerNotifierState {
  const factory Loaded(Retailer retailer, {required bool hasConnection}) =
      _$Loaded;
  const Loaded._() : super._();

  Retailer get retailer => throw _privateConstructorUsedError;
  bool get hasConnection => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({RetailerFailure retailerFailure});

  $RetailerFailureCopyWith<$Res> get retailerFailure;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res>
    extends _$RetailerNotifierStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object? retailerFailure = freezed,
  }) {
    return _then(Failure(
      retailerFailure == freezed
          ? _value.retailerFailure
          : retailerFailure // ignore: cast_nullable_to_non_nullable
              as RetailerFailure,
    ));
  }

  @override
  $RetailerFailureCopyWith<$Res> get retailerFailure {
    return $RetailerFailureCopyWith<$Res>(_value.retailerFailure, (value) {
      return _then(_value.copyWith(retailerFailure: value));
    });
  }
}

/// @nodoc

class _$Failure extends Failure {
  const _$Failure(this.retailerFailure) : super._();

  @override
  final RetailerFailure retailerFailure;

  @override
  String toString() {
    return 'RetailerNotifierState.failure(retailerFailure: $retailerFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.retailerFailure, retailerFailure) ||
                const DeepCollectionEquality()
                    .equals(other.retailerFailure, retailerFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(retailerFailure);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Retailer retailer, bool hasConnection) loaded,
    required TResult Function(RetailerFailure retailerFailure) failure,
  }) {
    return failure(retailerFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Retailer retailer, bool hasConnection)? loaded,
    TResult Function(RetailerFailure retailerFailure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(retailerFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure extends RetailerNotifierState {
  const factory Failure(RetailerFailure retailerFailure) = _$Failure;
  const Failure._() : super._();

  RetailerFailure get retailerFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}
