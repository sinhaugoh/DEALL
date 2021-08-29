import 'package:dartz/dartz.dart';
import 'package:deall/core/application/value_failures.dart';

/// validate email with condition
/// 
/// return [unit] if valid
/// 
/// return [ValueFailure.invalidEmail] if invalid
Either<ValueFailure, Unit> validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(unit);
  } else {
    return left(const ValueFailure.invalidEmail());
  }
}

/// validate password with condition:
/// - must contain at least 8 character
/// - must contain at least 1 numeric
/// 
/// return [unit] if valid
/// 
/// return [ValueFailure.invalidPassword] if invalid
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

/// validate postal code with condition:
/// - must be 6 digits
/// 
/// return [unit] if valid
/// 
/// return [ValueFailure.incorrectLength] if invalid
Either<ValueFailure, Unit> validatePostal(String input) {
  const postalLength = 6;

  return input.length == postalLength
      ? right(unit)
      : left(const ValueFailure.incorrectLength(postalLength));
}

///validate that the field is not empty
///
///return [unit] if valid
///
///return [ValueFailure.empty] if invalid
Either<ValueFailure, Unit> validateNotEmpty(String input) =>
    input != '' ? right(unit) : left(const ValueFailure.empty());

/// validate usual price with condition:
/// - not empty
/// - 0.01 < usual price < 10000
/// 
/// return [unit] if valid
/// 
/// return [ValueFailure.invalidPriceValue] if invalid
/// 
/// return [ValueFailure.invalidPriceValue] if exception thrown when parsing
/// input to double
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

/// validate usual price with condition:
/// - not empty
/// - 0.00 < usual price < usual price
/// 
/// return [unit] if valid
/// 
/// return [ValueFailure.invalidPriceValue] if invalid
/// 
/// return [ValueFailure.invalidPriceValue] if exception thrown when parsing
/// input to double
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
