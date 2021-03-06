import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const Product._();
  const factory Product({
    required String id,
    required String name,
    required double usualPrice,
    required double discountedPrice,
    required String image,
    required String description,
    required bool availability,
  }) = _Product;

  factory Product.initial() {
    return const Product(
      id: '',
      name: '',
      usualPrice: 0.00,
      discountedPrice: 0.00,
      image: '',
      description: '',
      availability: false,
    );
  }
}
