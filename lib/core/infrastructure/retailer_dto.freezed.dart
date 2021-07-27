// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'retailer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RetailerDTO _$RetailerDTOFromJson(Map<String, dynamic> json) {
  return _RetailerDTO.fromJson(json);
}

/// @nodoc
class _$RetailerDTOTearOff {
  const _$RetailerDTOTearOff();

  _RetailerDTO call(
      {required String name,
      required String block,
      required String street,
      required String unit,
      required String postalCode,
      required String operatingHours,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(defaultValue: '') String? image,
      required bool visibility}) {
    return _RetailerDTO(
      name: name,
      block: block,
      street: street,
      unit: unit,
      postalCode: postalCode,
      operatingHours: operatingHours,
      description: description,
      image: image,
      visibility: visibility,
    );
  }

  RetailerDTO fromJson(Map<String, Object> json) {
    return RetailerDTO.fromJson(json);
  }
}

/// @nodoc
const $RetailerDTO = _$RetailerDTOTearOff();

/// @nodoc
mixin _$RetailerDTO {
  String get name => throw _privateConstructorUsedError;
  String get block => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get operatingHours => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get description =>
      throw _privateConstructorUsedError; //TODO: include link to the default image / use the image from local
  @JsonKey(defaultValue: '')
  String? get image => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetailerDTOCopyWith<RetailerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailerDTOCopyWith<$Res> {
  factory $RetailerDTOCopyWith(
          RetailerDTO value, $Res Function(RetailerDTO) then) =
      _$RetailerDTOCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String block,
      String street,
      String unit,
      String postalCode,
      String operatingHours,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(defaultValue: '') String? image,
      bool visibility});
}

/// @nodoc
class _$RetailerDTOCopyWithImpl<$Res> implements $RetailerDTOCopyWith<$Res> {
  _$RetailerDTOCopyWithImpl(this._value, this._then);

  final RetailerDTO _value;
  // ignore: unused_field
  final $Res Function(RetailerDTO) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? block = freezed,
    Object? street = freezed,
    Object? unit = freezed,
    Object? postalCode = freezed,
    Object? operatingHours = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      block: block == freezed
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      operatingHours: operatingHours == freezed
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RetailerDTOCopyWith<$Res>
    implements $RetailerDTOCopyWith<$Res> {
  factory _$RetailerDTOCopyWith(
          _RetailerDTO value, $Res Function(_RetailerDTO) then) =
      __$RetailerDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String block,
      String street,
      String unit,
      String postalCode,
      String operatingHours,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(defaultValue: '') String? image,
      bool visibility});
}

/// @nodoc
class __$RetailerDTOCopyWithImpl<$Res> extends _$RetailerDTOCopyWithImpl<$Res>
    implements _$RetailerDTOCopyWith<$Res> {
  __$RetailerDTOCopyWithImpl(
      _RetailerDTO _value, $Res Function(_RetailerDTO) _then)
      : super(_value, (v) => _then(v as _RetailerDTO));

  @override
  _RetailerDTO get _value => super._value as _RetailerDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? block = freezed,
    Object? street = freezed,
    Object? unit = freezed,
    Object? postalCode = freezed,
    Object? operatingHours = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_RetailerDTO(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      block: block == freezed
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      operatingHours: operatingHours == freezed
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RetailerDTO extends _RetailerDTO {
  const _$_RetailerDTO(
      {required this.name,
      required this.block,
      required this.street,
      required this.unit,
      required this.postalCode,
      required this.operatingHours,
      @JsonKey(defaultValue: '') this.description,
      @JsonKey(defaultValue: '') this.image,
      required this.visibility})
      : super._();

  factory _$_RetailerDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_RetailerDTOFromJson(json);

  @override
  final String name;
  @override
  final String block;
  @override
  final String street;
  @override
  final String unit;
  @override
  final String postalCode;
  @override
  final String operatingHours;
  @override
  @JsonKey(defaultValue: '')
  final String? description;
  @override //TODO: include link to the default image / use the image from local
  @JsonKey(defaultValue: '')
  final String? image;
  @override
  final bool visibility;

  @override
  String toString() {
    return 'RetailerDTO(name: $name, block: $block, street: $street, unit: $unit, postalCode: $postalCode, operatingHours: $operatingHours, description: $description, image: $image, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RetailerDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.block, block) ||
                const DeepCollectionEquality().equals(other.block, block)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.operatingHours, operatingHours) ||
                const DeepCollectionEquality()
                    .equals(other.operatingHours, operatingHours)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(block) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(operatingHours) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(visibility);

  @JsonKey(ignore: true)
  @override
  _$RetailerDTOCopyWith<_RetailerDTO> get copyWith =>
      __$RetailerDTOCopyWithImpl<_RetailerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RetailerDTOToJson(this);
  }
}

abstract class _RetailerDTO extends RetailerDTO {
  const factory _RetailerDTO(
      {required String name,
      required String block,
      required String street,
      required String unit,
      required String postalCode,
      required String operatingHours,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(defaultValue: '') String? image,
      required bool visibility}) = _$_RetailerDTO;
  const _RetailerDTO._() : super._();

  factory _RetailerDTO.fromJson(Map<String, dynamic> json) =
      _$_RetailerDTO.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get block => throw _privateConstructorUsedError;
  @override
  String get street => throw _privateConstructorUsedError;
  @override
  String get unit => throw _privateConstructorUsedError;
  @override
  String get postalCode => throw _privateConstructorUsedError;
  @override
  String get operatingHours => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: '')
  String? get description => throw _privateConstructorUsedError;
  @override //TODO: include link to the default image / use the image from local
  @JsonKey(defaultValue: '')
  String? get image => throw _privateConstructorUsedError;
  @override
  bool get visibility => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RetailerDTOCopyWith<_RetailerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
