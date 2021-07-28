import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deall/core/application/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const ProductDTO._();
  const factory ProductDTO({
    required String name,
    required double usualPrice,
    required double discountPrice,
    @JsonKey(defaultValue: '') String? image,
    @JsonKey(defaultValue: '') String? description,
    required bool availability,
  }) = _ProductDTO;

  factory ProductDTO.fromDomain(Product product){
    return ProductDTO(
      name: product.name,
      usualPrice: product.usualPrice,
      discountPrice: product.discountPrice,
      image: product.image,
      description: product.description,
      availability: product.availability,
    );
  }

  Product toDomain(){
    return Product(
      name: name,
      usualPrice: usualPrice,
      discountPrice: discountPrice,
      image: image,
      description: description,
      availability: availability,
    );
  }

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}
