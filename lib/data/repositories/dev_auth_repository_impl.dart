import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';
import 'package:flutter/material.dart';

class DevAuthRepositoryImpl extends AuthRepository {
  DevAuthRepositoryImpl(super.secureStorage);

  @override
  Future<bool> signIn(String email, String password) async {
    await secureStorage.write(FSecureStorageRepository.acessTokenKey, 'token');
    return true;
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
