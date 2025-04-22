import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';

class FSecureStorageRepositoryImpl extends FSecureStorageRepository {
  FSecureStorageRepositoryImpl(super.secureStorage);

  @override
  Future<void> write(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) {
    return secureStorage.delete(key: key);
  }

  @override
  Future<String> read(String key) async {
    return await secureStorage.read(key: key) ?? '';
  }
}
