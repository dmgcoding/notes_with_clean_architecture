import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';

abstract class AuthRepository {
  final FSecureStorageRepository secureStorage;
  AuthRepository(this.secureStorage);

  Future<bool> checkForAuth();
  Future<bool> signIn(String email, String password);
  Future<void> signOut();
}
