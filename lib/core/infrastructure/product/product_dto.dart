import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deall/core/application/product/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

FieldValue? _dateModifiedFromJson(Object? json) {
  return null;
}

Object? _dateModifiedToJson(FieldValue? value) {
  return value;
}

@freezed
class ProductDTO with _$ProductDTO {
  const ProductDTO._();
  const factory ProductDTO({
    required String id,
    required String name,
    required double usualPrice,
    required double discountedPrice,
    required String image,
    required String description,
    required bool availability,
    @JsonKey(
      fromJson: _dateModifiedFromJson,
      toJson: _dateModifiedToJson,
    )
        required FieldValue? dateModified,
  }) = _ProductDTO;

  factory ProductDTO.fromDomain(Product product) {
    return ProductDTO(
      id: product.id,
      name: product.name,
      usualPrice: product.usualPrice,
      discountedPrice: product.discountedPrice,
      image: product.image,
      description: product.description,
      availability: product.availability,
      dateModified: FieldValue.serverTimestamp(),
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      usualPrice: usualPrice,
      discountedPrice: discountedPrice,
      image: image,
      description: description,
      availability: availability,
    );
  }
  
  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}