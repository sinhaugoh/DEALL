import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String name,
    required double usualPrice,
    required double discountPrice,
    String? image,
    String? description,
    required bool availablity,
  }) = _Product;
}

// run this on terminal if error: "flutter pub run build_runner build"