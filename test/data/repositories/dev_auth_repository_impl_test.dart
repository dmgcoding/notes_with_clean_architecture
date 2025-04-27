import 'package:clean_arch_test1/data/repositories/dev_auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockDevAuthRepositoryImpl extends Mock
    implements DevAuthRepositoryImpl {}

void main() {
  final mockDevAuthRepositoryImpl = MockDevAuthRepositoryImpl();
  group('dev auth repository methods returns correct values', () {
    test('if checkForAuth returns false', () async {
      when(() => mockDevAuthRepositoryImpl.checkForAuth())
          .thenAnswer((_) async => false);
      final result = await mockDevAuthRepositoryImpl.checkForAuth();
      expect(result, false);
    });

    test('if signin called returns true', () async {
      when(() => mockDevAuthRepositoryImpl.signIn(any(), any()))
          .thenAnswer((_) async => true);
      final result = await mockDevAuthRepositoryImpl.signIn('test', 'test');
      expect(result, true);
    });
  });
}
