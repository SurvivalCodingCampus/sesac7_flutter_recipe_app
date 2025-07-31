import 'package:flutter_recipe_app/core/utils/extension/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtension', () {
    group('capitalizeFirstLetter', () {
      test(
        'Given a lowercase string, '
        'When capitalizeFirstLetter is called, '
        'Then it should return the string with the first letter capitalized',
        () {
          // Given
          const text = 'hello';

          // When
          final result = text.capitalizeFirstLetter();

          // Then
          expect(result, 'Hello');
        },
      );

      test('Given an already capitalized string, '
          'When capitalizeFirstLetter is called, '
          'Then it should return the same string', () {
        // Given
        const text = 'World';

        // When
        final result = text.capitalizeFirstLetter();

        // Then
        expect(result, 'World');
      });

      test('Given an empty string, '
          'When capitalizeFirstLetter is called, '
          'Then it should return an empty string', () {
        // Given
        const text = '';

        // When
        final result = text.capitalizeFirstLetter();

        // Then
        expect(result, '');
      });

      test('Given a single character string, '
          'When capitalizeFirstLetter is called, '
          'Then it should return the capitalized character', () {
        // Given
        const text = 'a';

        // When
        final result = text.capitalizeFirstLetter();

        // Then
        expect(result, 'A');
      });
    });
  });
}
