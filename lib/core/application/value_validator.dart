import 'package:dartz/dartz.dart';
import 'package:deall/core/application/value_failures.dart';

Either<ValueFailure, Unit> validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(unit);
  } else {
    return left(const ValueFailure.invalidEmail());
  }
}

Either<ValueFailure, Unit> validatePassword(String input) {
  // must contain at least 8 char
  // must contain at least 1 numeric
  const passwordRegex = r'^(?=.*?[0-9]).{8,}$';

  if (RegExp(passwordRegex).hasMatch(input)) {
    return right(unit);
  } else {
    return left(const ValueFailure.invalidPassword());
  }
}

Either<ValueFailure, Unit> validatePostal(String input) {
  const postalLength = 6;

  return input.length == postalLength
      ? right(unit)
      : left(const ValueFailure.incorrectLength(postalLength));
}

Either<ValueFailure, Unit> validateNotEmpty(String input) =>
    input != '' ? right(unit) : left(const ValueFailure.empty());

Either<ValueFailure, Unit> validateUsualPrice(double input) {
  return input >= 0.0 && input <= 10000 ? right(unit) : left(const ValueFailure.invalidPriceValue());
}

Either<ValueFailure, Unit> validateDiscountedPrice(double input, double usualPrice) {
  return input >= 0.0 && input <= 10000 && input < usualPrice ? right(unit) : left(const ValueFailure.invalidPriceValue());
}