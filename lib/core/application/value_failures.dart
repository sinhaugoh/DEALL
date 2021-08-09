import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
class ValueFailure with _$ValueFailure {
  const ValueFailure._();
  const factory ValueFailure.empty() = Empty;
  const factory ValueFailure.invalidEmail() = InvalidEmail;
  const factory ValueFailure.invalidPassword() = InvalidPassword;
  const factory ValueFailure.incorrectLength(int length) = IncorrectLength;
  const factory ValueFailure.invalidPriceValue() = InvalidPriceValue;
}