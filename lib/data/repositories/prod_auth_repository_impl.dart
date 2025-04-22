import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';
import 'package:flutter/material.dart';

class ProdAuthRepositoryImpl extends AuthRepository {
  ProdAuthRepositoryImpl(super.secureStorage);

  static const _email = 'test@test.com';
  static const _password = '123456';

  @override
  Future<bool> signIn(String email, String password) async {
    if (email == _email && password == _password) {
      await secureStorage.write(
          FSecureStorageRepository.acessTokenKey, 'token');
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    await secureStorage.delete(FSecureStorageRepository.acessTokenKey);
  }

  @override
  Future<bool> checkForAuth() async {
    try {
      return await secureStorage.read(FSecureStorageRepository.acessTokenKey) !=
          '';
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
