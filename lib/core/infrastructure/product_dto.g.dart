// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDTO _$_$_ProductDTOFromJson(Map<String, dynamic> json) {
  return _$_ProductDTO(
    id: json['id'] as String,
    name: json['name'] as String,
    usualPrice: (json['usualPrice'] as num).toDouble(),
    discountedPrice: (json['discountedPrice'] as num).toDouble(),
    image: json['image'] as String,
    description: json['description'] as String,
    availability: json['availability'] as bool,
    dateModified: _dateModifiedFromJson(json['dateModified']),
  );
}

Map<String, dynamic> _$_$_ProductDTOToJson(_$_ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'usualPrice': instance.usualPrice,
      'discountedPrice': instance.discountedPrice,
      'image': instance.image,
      'description': instance.description,
      'availability': instance.availability,
      'dateModified': _dataModifiedToJson(instance.dateModified),
    };
