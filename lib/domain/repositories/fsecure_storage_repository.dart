import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class FSecureStorageRepository {
  final FlutterSecureStorage secureStorage;
  FSecureStorageRepository(this.secureStorage);

  static const acessTokenKey = 'accessToken';

  Future<void> write(String key, String value);
  Future<String> read(String key);
  Future<void> delete(String key);
}
