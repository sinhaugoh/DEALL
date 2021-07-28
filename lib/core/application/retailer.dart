import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer.freezed.dart';

@freezed
abstract class Retailer with _$Retailer {
  const factory Retailer({
    required String name,
    required String block,
    required String street,
    required String unit,
    required String postalCode,
    required String operatingHours,
    String? description,
    String? image,
    required bool visibility,
  }) = _Retailer;

  String addressLine (){
    return "$block $street $unit $postalCode";
  }
}