import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer.freezed.dart';

@freezed
abstract class Retailer with _$Retailer {
  const Retailer._();
  const factory Retailer({
    required String id,
    required String name,
    required String block,
    required String street,
    required String unit,
    required String postalCode,
    required String operatingHours,
    required String description,
    required String image,
    required bool visibility,
    required String uen,
  }) = _Retailer;

  factory Retailer.initial() {
    return const Retailer(
      id: '',
      name: '',
      block: '',
      street: '',
      unit: '',
      postalCode: '',
      operatingHours: '',
      description: '',
      image: '',
      visibility: false,
      uen: '',
    );
  }

  String addressLine() {
    return "$block $street \n $unit $postalCode";
  }
}
