import 'package:clean_arch_test1/app/view/app.dart';
import 'package:clean_arch_test1/data/repositories/dev_auth_repository_impl.dart';
import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/hive_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:clean_arch_test1/main/bootstrap/bootstrap.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  bootstrap(({
    required SharedPreferences sharedPreferences,
    required FlutterSecureStorage secureStorage,
    required HiveStorageRepository hiveStorageRepository,
    required FSecureStorageRepository fSecureStorageRepository,
    required NotesRepository notesRepository,
  }) async {
    final authRepository = DevAuthRepositoryImpl(fSecureStorageRepository);
    return App(
      authRepository: authRepository,
      hiveStorageRepository: hiveStorageRepository,
      fSecureStorageRepository: fSecureStorageRepository,
      notesRepository: notesRepository,
    );
  });
}
