// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {required String name,
      required double usualPrice,
      required double discountPrice,
      String? image,
      String? description,
      required bool availability}) {
    return _Product(
      name: name,
      usualPrice: usualPrice,
      discountPrice: discountPrice,
      image: image,
      description: description,
      availability: availability,
    );
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError;
  double get usualPrice => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get availability => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String name,
      double usualPrice,
      double discountPrice,
      String? image,
      String? description,
      bool availability});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? usualPrice = freezed,
    Object? discountPrice = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? availability = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usualPrice: usualPrice == freezed
          ? _value.usualPrice
          : usualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      double usualPrice,
      double discountPrice,
      String? image,
      String? description,
      bool availability});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? name = freezed,
    Object? usualPrice = freezed,
    Object? discountPrice = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? availability = freezed,
  }) {
    return _then(_Product(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usualPrice: usualPrice == freezed
          ? _value.usualPrice
          : usualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: discountPrice == freezed
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Product implements _Product {
  const _$_Product(
      {required this.name,
      required this.usualPrice,
      required this.discountPrice,
      this.image,
      this.description,
      required this.availability});

  @override
  final String name;
  @override
  final double usualPrice;
  @override
  final double discountPrice;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final bool availability;

  @override
  String toString() {
    return 'Product(name: $name, usualPrice: $usualPrice, discountPrice: $discountPrice, image: $image, description: $description, availability: $availability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.usualPrice, usualPrice) ||
                const DeepCollectionEquality()
                    .equals(other.usualPrice, usualPrice)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.availability, availability) ||
                const DeepCollectionEquality()
                    .equals(other.availability, availability)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(usualPrice) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(availability);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(
      {required String name,
      required double usualPrice,
      required double discountPrice,
      String? image,
      String? description,
      required bool availability}) = _$_Product;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get usualPrice => throw _privateConstructorUsedError;
  @override
  double get discountPrice => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  bool get availability => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
