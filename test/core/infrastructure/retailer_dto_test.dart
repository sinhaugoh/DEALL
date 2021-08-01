import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/infrastructure/retailer_dto.dart';

import 'retailer_dto_test.mocks.dart';

@GenerateMocks([
  RetailerDTO,
])
void main() {
  group('toDomain', () {
    test('should return Retailer object with the same field values after converting RetailerDTO object', () {
      final mockRetailerDTO = MockRetailerDTO();
      const retailerTest = Retailer(
        name: 'test name',
        block: 'test block',
        street: 'test street',
        unit: 'test unit',
        postalCode: 'test postalCode',
        operatingHours: 'test operating hours',
        image: '',
        description: 'test description',
        visibility: true,
      );
      when(mockRetailerDTO.toDomain()).thenAnswer((_) => retailerTest);
      when(mockRetailerDTO.name).thenReturn('test name');
      

      expect(mockRetailerDTO.toDomain(), isA<Retailer>());
      expect(mockRetailerDTO.name, equals(mockRetailerDTO.toDomain().name));
    });
  });
}
