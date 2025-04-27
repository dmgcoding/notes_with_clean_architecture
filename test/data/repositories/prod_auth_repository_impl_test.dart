import 'package:clean_arch_test1/data/repositories/prod_auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockProdAuthRepositoryImpl extends Mock
    implements ProdAuthRepositoryImpl {}

void main() {
  final mockProdAuthRepositoryImpl = MockProdAuthRepositoryImpl();
  group('prod auth repository methods returns correct values', () {
    test('if checkForAuth returns false', () async {
      when(() => mockProdAuthRepositoryImpl.checkForAuth())
          .thenAnswer((_) async => false);
      final result = await mockProdAuthRepositoryImpl.checkForAuth();
      expect(result, false);
    });

    test('if signin called returns true', () async {
      when(() => mockProdAuthRepositoryImpl.signIn(any(), any()))
          .thenAnswer((_) async => true);
      final result = await mockProdAuthRepositoryImpl.signIn('test', 'test');
      expect(result, true);
    });
  });
}
