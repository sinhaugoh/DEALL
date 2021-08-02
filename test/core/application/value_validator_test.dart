import 'package:dartz/dartz.dart';
import 'package:deall/core/application/value_failures.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validateEmail', () {
    test('should return ValueFailure.invalidEmail if the input is empty', () {
      final result = validateEmail('');
      expect(result, left(const ValueFailure.invalidEmail()));
    });

    test(
        'should return ValueFailure.invalidEmail if the input is not email format',
        () {
      final result = validateEmail('test');
      expect(result, left(const ValueFailure.invalidEmail()));
    });

    test(
        'should return ValueFailure.invalidEmail if the input is not email format',
        () {
      final result = validateEmail('test@');
      expect(result, left(const ValueFailure.invalidEmail()));
    });

    test(
        'should return ValueFailure.invalidEmail if the input is not email format',
        () {
      final result = validateEmail('test@gmail');
      expect(result, left(const ValueFailure.invalidEmail()));
    });

    test(
        'should return ValueFailure.invalidEmail if the input is not email format',
        () {
      final result = validateEmail('test@gmail.');
      expect(result, left(const ValueFailure.invalidEmail()));
    });

    test('should return Unit if the input is in correct email format', () {
      final result = validateEmail('test@gmail.c');
      expect(result, right(unit));
    });

    test('should return Unit if the input is in correct email format', () {
      final result = validateEmail('test@gmail.com');
      expect(result, right(unit));
    });
  });

  group('validatePassword', () {
    test('should return ValurFailure.invalidPassword if the input is empty',
        () {
      final result = validatePassword('');
      expect(result, left(const ValueFailure.invalidPassword()));
    });

    test('should return ValurFailure.invalidPassword if the input length < 8',
        () {
      final result = validatePassword('test');
      expect(result, left(const ValueFailure.invalidPassword()));
    });

    test(
        'should return ValurFailure.invalidPassword if the input length >= 8 but does not contain numeric',
        () {
      final result = validatePassword('testingg');
      expect(result, left(const ValueFailure.invalidPassword()));
    });

    test(
        'should return Unit if the input contain at least 1 numeric char and length of 8 or above',
        () {
      final result = validatePassword('test1234');
      expect(result, right(unit));
    });
  });

  group('validatePostal', () {
    test('should return ValueFailure.incorrectLength if the postal length is not 6', () {
      final result = validatePostal('12345');
      expect(result, left(const ValueFailure.incorrectLength(6)));
    });

    test('should return Unit if the postal length is 6', () {
      final result = validatePostal('123456');
      expect(result, right(unit));
    });
  });

  group('validateNotEmpty', () {
    test('should return ValueFailure.empty if the input is empty', () {
      final result = validateNotEmpty('');
      expect(result, left(const ValueFailure.empty()));
    });

    test('should return Unit if the input is not empty', () {
      final result = validateNotEmpty('any');
      expect(result, right(unit));
    });
  });
}
