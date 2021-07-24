import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String prodId,
    required String prodName,
    String? prodUrl,
    double? usualPrice,
    required double discountedPrice,
    String? prodDescription,
  }) = _Product;
}

// run this on terminal if error: "flutter pub run build_runner build"