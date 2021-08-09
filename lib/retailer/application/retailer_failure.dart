import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_failure.freezed.dart';

@freezed
class RetailerFailure with _$RetailerFailure {
  const RetailerFailure._();
  const factory RetailerFailure.noConnection() = NoConnection;
  const factory RetailerFailure.unexpected(String errorMessage) = Unexpected;
  const factory RetailerFailure.notFound() = NotFound;
  const factory RetailerFailure.authentication(String errorMessage) = Authentication;
}