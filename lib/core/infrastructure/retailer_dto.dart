import 'package:deall/core/application/retailer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_dto.freezed.dart';
part 'retailer_dto.g.dart';

@freezed
class RetailerDTO with _$RetailerDTO {
  const RetailerDTO._();
  const factory RetailerDTO({
    required String name,
    required String block,
    required String street,
    required String unit,
    required String postalCode,
    required String operatingHours,
    @JsonKey(defaultValue: '') String? description,
    //TODO: include link to the default image / use the image from local
    @JsonKey(defaultValue: '') String? image,
    required bool visibility,
  }) = _RetailerDTO;

  factory RetailerDTO.fromDomain(Retailer retailer) {
    return RetailerDTO(
        name: retailer.name,
        block: retailer.block,
        street: retailer.street,
        unit: retailer.unit,
        postalCode: retailer.postalCode,
        operatingHours: retailer.operatingHours,
        visibility: retailer.visibility);
  }

  Retailer toDomain() {
    return Retailer(
        name: name,
        block: block,
        street: street,
        unit: unit,
        postalCode: postalCode,
        operatingHours: operatingHours,
        visibility: visibility);
  }

  factory RetailerDTO.fromJson(Map<String, dynamic> json) =>
      _$RetailerDTOFromJson(json);
}
