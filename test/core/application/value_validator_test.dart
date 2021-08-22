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
    test(
        'should return ValueFailure.incorrectLength if the postal length is not 6',
        () {
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

  group('validateUsualPrice', () {
    test('should return ValueFailure.empty if the input is empty', () {
      final result = validateUsualPrice('');
      expect(result, left(const ValueFailure.empty()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the string input is not convertable to double',
        () {
      final result = validateUsualPrice('test');
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the input is less than 0.02',
        () {
      final result = validateUsualPrice('0.01');
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the input is more than 9999.99',
        () {
      final result = validateUsualPrice('10000');
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return Unit if the input is more than 0.01 and less than 10000',
        () {
      const testData = '9999.99';
      final result = validateUsualPrice(testData);
      expect(result, right(9999.99));
    });
  });

  group('validateDiscountedPrice', () {
    const testUsualPrice = 30.00;
    test('should return ValueFailure.empty if the input is empty', () {
      final result = validateDiscountedPrice('', testUsualPrice);
      expect(result, left(const ValueFailure.empty()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the discounted price string is not convertable to double',
        () {
      final result = validateDiscountedPrice('test', testUsualPrice);
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the discounted price is less than 0.01',
        () {
      final result = validateDiscountedPrice('0.00', 0.00);
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the discounted price is more than 9999.99',
        () {
      final result = validateDiscountedPrice('10000', testUsualPrice);
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the discounted price is equal to the usual price',
        () {
      final result = validateDiscountedPrice('30.00', testUsualPrice);
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return ValueFailure.InvalidPriceValue if the discounted price is more than the usual price',
        () {
      final result = validateDiscountedPrice('30.01', testUsualPrice);
      expect(result, left(const ValueFailure.invalidPriceValue()));
    });

    test(
        'should return Unit if the input is more than 0.00 and less than 10000 and less than usual price',
        () {
      final result = validateDiscountedPrice('29.99', testUsualPrice);
      expect(result, right(29.99));
    });
  });
}
