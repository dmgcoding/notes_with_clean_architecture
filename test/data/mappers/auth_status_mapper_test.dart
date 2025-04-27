import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/core/common/form_status.dart';
import 'package:clean_arch_test1/data/mappers/auth_status_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('auth status mapper', () {
    test('should return authenticated if form status is success', () {
      final formStatus = FormStatus.success;
      final authStatus = fromLoginFormStatus(formStatus);
      expect(authStatus, AuthStatusState.authenticated);
    });

    test('should return unauthenticated if form status is error', () {
      final formStatus = FormStatus.error;
      final authStatus = fromLoginFormStatus(formStatus);
      expect(authStatus, AuthStatusState.unauthenticated);
    });

    test('should return unauthenticated if form status is anything else', () {
      final formStatus = FormStatus.loading;
      final authStatus = fromLoginFormStatus(formStatus);
      expect(authStatus, AuthStatusState.unauthenticated);
    });
  });
}
