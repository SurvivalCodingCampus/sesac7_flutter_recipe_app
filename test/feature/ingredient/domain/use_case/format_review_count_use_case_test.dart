import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormatReviewCountUseCase', () {
    late FormatReviewCountUseCase useCase;

    setUp(() {
      useCase = FormatReviewCountUseCase();
    });

    test(
        'Given a count less than 1000, ' 
        'When execute is called, ' 
        'Then it should return the number as a string', () {
      // Given
      const count = 999;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '999');
    });

    test(
        'Given a count of exactly 1000, ' 
        'When execute is called, ' 
        'Then it should return "1K"', () {
      // Given
      const count = 1000;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '1K');
    });

    test(
        'Given a count of 1500, ' 
        'When execute is called, ' 
        'Then it should return "1.5K"', () {
      // Given
      const count = 1500;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '1.5K');
    });

    test(
        'Given a count of 1,000,000, ' 
        'When execute is called, ' 
        'Then it should return "1M"', () {
      // Given
      const count = 1000000;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '1M');
    });

    test(
        'Given a count of 1,200,000, ' 
        'When execute is called, ' 
        'Then it should return "1.2M"', () {
      // Given
      const count = 1200000;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '1.2M');
    });

    test(
        'Given a count of 0, ' 
        'When execute is called, ' 
        'Then it should return "0"', () {
      // Given
      const count = 0;

      // When
      final result = useCase.execute(count);

      // Then
      expect(result, '0');
    });
  });
}
