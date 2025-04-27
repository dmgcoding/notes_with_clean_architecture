import 'package:clean_arch_test1/data/repositories/fsecure_storage_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late FSecureStorageRepositoryImpl repository;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    repository = FSecureStorageRepositoryImpl(mockSecureStorage);
  });

  group('FSecureStorageRepositoryImpl', () {
    const testKey = 'test_key';
    const testValue = 'test_value';

    test('write method should call secureStorage.write with correct parameters',
        () async {
      // Arrange
      when(() => mockSecureStorage.write(key: testKey, value: testValue))
          .thenAnswer((_) async {});

      // Act
      await repository.write(testKey, testValue);

      // Assert
      verify(() => mockSecureStorage.write(key: testKey, value: testValue))
          .called(1);
    });

    test('delete method should call secureStorage.delete with correct key',
        () async {
      // Arrange
      when(() => mockSecureStorage.delete(key: testKey))
          .thenAnswer((_) async {});

      // Act
      await repository.delete(testKey);

      // Assert
      verify(() => mockSecureStorage.delete(key: testKey)).called(1);
    });

    test('read method should return value from secureStorage.read', () async {
      // Arrange
      when(() => mockSecureStorage.read(key: testKey))
          .thenAnswer((_) async => testValue);

      // Act
      final result = await repository.read(testKey);

      // Assert
      expect(result, testValue);
      verify(() => mockSecureStorage.read(key: testKey)).called(1);
    });

    test(
        'read method should return empty string when secureStorage.read returns null',
        () async {
      // Arrange
      when(() => mockSecureStorage.read(key: testKey))
          .thenAnswer((_) async => null);

      // Act
      final result = await repository.read(testKey);

      // Assert
      expect(result, '');
      verify(() => mockSecureStorage.read(key: testKey)).called(1);
    });
  });
}
