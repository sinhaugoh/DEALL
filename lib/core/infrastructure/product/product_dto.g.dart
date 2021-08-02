// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDTO _$_$_ProductDTOFromJson(Map<String, dynamic> json) {
  return _$_ProductDTO(
    name: json['name'] as String,
    usualPrice: (json['usualPrice'] as num).toDouble(),
    discountPrice: (json['discountPrice'] as num).toDouble(),
    image: json['image'] as String,
    description: json['description'] as String,
    availability: json['availability'] as bool,
  );
}

Map<String, dynamic> _$_$_ProductDTOToJson(_$_ProductDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'usualPrice': instance.usualPrice,
      'discountPrice': instance.discountPrice,
      'image': instance.image,
      'description': instance.description,
      'availability': instance.availability,
    };
