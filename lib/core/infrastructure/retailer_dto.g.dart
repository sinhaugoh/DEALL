// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_RetailerDTO _$_$_RetailerDTOFromJson(Map<String, dynamic> json) {
  return _$_RetailerDTO(
    name: json['name'] as String,
    block: json['block'] as String,
    street: json['street'] as String,
    unit: json['unit'] as String,
    postalCode: json['postalCode'] as String,
    operatingHours: json['operatingHours'] as String,
    description: json['description'] as String? ?? '',
    image: json['image'] as String? ?? '',
    visibility: json['visibility'] as bool,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_RetailerDTOToJson(_$_RetailerDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'block': instance.block,
      'street': instance.street,
      'unit': instance.unit,
      'postalCode': instance.postalCode,
      'operatingHours': instance.operatingHours,
      'description': instance.description,
      'image': instance.image,
      'visibility': instance.visibility,
    };
