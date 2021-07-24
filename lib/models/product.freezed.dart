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
      {required String prodId,
      required String prodName,
      String? prodUrl,
      double? usualPrice,
      required double discountedPrice,
      String? prodDescription}) {
    return _Product(
      prodId: prodId,
      prodName: prodName,
      prodUrl: prodUrl,
      usualPrice: usualPrice,
      discountedPrice: discountedPrice,
      prodDescription: prodDescription,
    );
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  String get prodId => throw _privateConstructorUsedError;
  String get prodName => throw _privateConstructorUsedError;
  String? get prodUrl => throw _privateConstructorUsedError;
  double? get usualPrice => throw _privateConstructorUsedError;
  double get discountedPrice => throw _privateConstructorUsedError;
  String? get prodDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String prodId,
      String prodName,
      String? prodUrl,
      double? usualPrice,
      double discountedPrice,
      String? prodDescription});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? prodId = freezed,
    Object? prodName = freezed,
    Object? prodUrl = freezed,
    Object? usualPrice = freezed,
    Object? discountedPrice = freezed,
    Object? prodDescription = freezed,
  }) {
    return _then(_value.copyWith(
      prodId: prodId == freezed
          ? _value.prodId
          : prodId // ignore: cast_nullable_to_non_nullable
              as String,
      prodName: prodName == freezed
          ? _value.prodName
          : prodName // ignore: cast_nullable_to_non_nullable
              as String,
      prodUrl: prodUrl == freezed
          ? _value.prodUrl
          : prodUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      usualPrice: usualPrice == freezed
          ? _value.usualPrice
          : usualPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: discountedPrice == freezed
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      prodDescription: prodDescription == freezed
          ? _value.prodDescription
          : prodDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String prodId,
      String prodName,
      String? prodUrl,
      double? usualPrice,
      double discountedPrice,
      String? prodDescription});
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
    Object? prodId = freezed,
    Object? prodName = freezed,
    Object? prodUrl = freezed,
    Object? usualPrice = freezed,
    Object? discountedPrice = freezed,
    Object? prodDescription = freezed,
  }) {
    return _then(_Product(
      prodId: prodId == freezed
          ? _value.prodId
          : prodId // ignore: cast_nullable_to_non_nullable
              as String,
      prodName: prodName == freezed
          ? _value.prodName
          : prodName // ignore: cast_nullable_to_non_nullable
              as String,
      prodUrl: prodUrl == freezed
          ? _value.prodUrl
          : prodUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      usualPrice: usualPrice == freezed
          ? _value.usualPrice
          : usualPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: discountedPrice == freezed
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      prodDescription: prodDescription == freezed
          ? _value.prodDescription
          : prodDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Product implements _Product {
  const _$_Product(
      {required this.prodId,
      required this.prodName,
      this.prodUrl,
      this.usualPrice,
      required this.discountedPrice,
      this.prodDescription});

  @override
  final String prodId;
  @override
  final String prodName;
  @override
  final String? prodUrl;
  @override
  final double? usualPrice;
  @override
  final double discountedPrice;
  @override
  final String? prodDescription;

  @override
  String toString() {
    return 'Product(prodId: $prodId, prodName: $prodName, prodUrl: $prodUrl, usualPrice: $usualPrice, discountedPrice: $discountedPrice, prodDescription: $prodDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.prodId, prodId) ||
                const DeepCollectionEquality().equals(other.prodId, prodId)) &&
            (identical(other.prodName, prodName) ||
                const DeepCollectionEquality()
                    .equals(other.prodName, prodName)) &&
            (identical(other.prodUrl, prodUrl) ||
                const DeepCollectionEquality()
                    .equals(other.prodUrl, prodUrl)) &&
            (identical(other.usualPrice, usualPrice) ||
                const DeepCollectionEquality()
                    .equals(other.usualPrice, usualPrice)) &&
            (identical(other.discountedPrice, discountedPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountedPrice, discountedPrice)) &&
            (identical(other.prodDescription, prodDescription) ||
                const DeepCollectionEquality()
                    .equals(other.prodDescription, prodDescription)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(prodId) ^
      const DeepCollectionEquality().hash(prodName) ^
      const DeepCollectionEquality().hash(prodUrl) ^
      const DeepCollectionEquality().hash(usualPrice) ^
      const DeepCollectionEquality().hash(discountedPrice) ^
      const DeepCollectionEquality().hash(prodDescription);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(
      {required String prodId,
      required String prodName,
      String? prodUrl,
      double? usualPrice,
      required double discountedPrice,
      String? prodDescription}) = _$_Product;

  @override
  String get prodId => throw _privateConstructorUsedError;
  @override
  String get prodName => throw _privateConstructorUsedError;
  @override
  String? get prodUrl => throw _privateConstructorUsedError;
  @override
  double? get usualPrice => throw _privateConstructorUsedError;
  @override
  double get discountedPrice => throw _privateConstructorUsedError;
  @override
  String? get prodDescription => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
