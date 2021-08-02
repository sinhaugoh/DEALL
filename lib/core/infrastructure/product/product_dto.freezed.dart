// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) {
  return _ProductDTO.fromJson(json);
}

/// @nodoc
class _$ProductDTOTearOff {
  const _$ProductDTOTearOff();

  _ProductDTO call(
      {required String name,
      required double usualPrice,
      required double discountPrice,
      required String image,
      required String description,
      required bool availability}) {
    return _ProductDTO(
      name: name,
      usualPrice: usualPrice,
      discountPrice: discountPrice,
      image: image,
      description: description,
      availability: availability,
    );
  }

  ProductDTO fromJson(Map<String, Object> json) {
    return ProductDTO.fromJson(json);
  }
}

/// @nodoc
const $ProductDTO = _$ProductDTOTearOff();

/// @nodoc
mixin _$ProductDTO {
  String get name => throw _privateConstructorUsedError;
  double get usualPrice => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get availability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDTOCopyWith<ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDTOCopyWith<$Res> {
  factory $ProductDTOCopyWith(
          ProductDTO value, $Res Function(ProductDTO) then) =
      _$ProductDTOCopyWithImpl<$Res>;
  $Res call(
      {String name,
      double usualPrice,
      double discountPrice,
      String image,
      String description,
      bool availability});
}

/// @nodoc
class _$ProductDTOCopyWithImpl<$Res> implements $ProductDTOCopyWith<$Res> {
  _$ProductDTOCopyWithImpl(this._value, this._then);

  final ProductDTO _value;
  // ignore: unused_field
  final $Res Function(ProductDTO) _then;

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
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProductDTOCopyWith<$Res> implements $ProductDTOCopyWith<$Res> {
  factory _$ProductDTOCopyWith(
          _ProductDTO value, $Res Function(_ProductDTO) then) =
      __$ProductDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      double usualPrice,
      double discountPrice,
      String image,
      String description,
      bool availability});
}

/// @nodoc
class __$ProductDTOCopyWithImpl<$Res> extends _$ProductDTOCopyWithImpl<$Res>
    implements _$ProductDTOCopyWith<$Res> {
  __$ProductDTOCopyWithImpl(
      _ProductDTO _value, $Res Function(_ProductDTO) _then)
      : super(_value, (v) => _then(v as _ProductDTO));

  @override
  _ProductDTO get _value => super._value as _ProductDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? usualPrice = freezed,
    Object? discountPrice = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? availability = freezed,
  }) {
    return _then(_ProductDTO(
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
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDTO extends _ProductDTO {
  const _$_ProductDTO(
      {required this.name,
      required this.usualPrice,
      required this.discountPrice,
      required this.image,
      required this.description,
      required this.availability})
      : super._();

  factory _$_ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductDTOFromJson(json);

  @override
  final String name;
  @override
  final double usualPrice;
  @override
  final double discountPrice;
  @override
  final String image;
  @override
  final String description;
  @override
  final bool availability;

  @override
  String toString() {
    return 'ProductDTO(name: $name, usualPrice: $usualPrice, discountPrice: $discountPrice, image: $image, description: $description, availability: $availability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductDTO &&
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
  _$ProductDTOCopyWith<_ProductDTO> get copyWith =>
      __$ProductDTOCopyWithImpl<_ProductDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductDTOToJson(this);
  }
}

abstract class _ProductDTO extends ProductDTO {
  const factory _ProductDTO(
      {required String name,
      required double usualPrice,
      required double discountPrice,
      required String image,
      required String description,
      required bool availability}) = _$_ProductDTO;
  const _ProductDTO._() : super._();

  factory _ProductDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductDTO.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get usualPrice => throw _privateConstructorUsedError;
  @override
  double get discountPrice => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  bool get availability => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductDTOCopyWith<_ProductDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
