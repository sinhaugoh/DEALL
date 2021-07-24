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
