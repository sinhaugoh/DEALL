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

Either<ValueFailure, double> validateUsualPrice(String input) {
  if (input == '') {
    return left(const ValueFailure.empty());
  }

  try {
    final convertedInput = double.parse(input);
    return convertedInput > 0.01 && convertedInput < 10000
        ? right(convertedInput)
        : left(const ValueFailure.invalidPriceValue());
  } catch (_) {
    return left(const ValueFailure.invalidPriceValue());
  }
}

Either<ValueFailure, double> validateDiscountedPrice(
    String input, double usualPrice) {
  if (input == '') {
    return left(const ValueFailure.empty());
  }
  try {
    final convertedInput = double.parse(input);
    return convertedInput > 0.0 &&
            convertedInput < 10000 &&
            convertedInput < usualPrice
        ? right(convertedInput)
        : left(const ValueFailure.invalidPriceValue());
  } catch (e) {
    return left(const ValueFailure.invalidPriceValue());
  }
}
