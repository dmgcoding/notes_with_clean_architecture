import 'dart:async';

import 'package:clean_arch_test1/data/repositories/fsecure_storage_repository_impl.dart';
import 'package:clean_arch_test1/data/repositories/hive_storage_repository_impl.dart';
import 'package:clean_arch_test1/data/repositories/notes_repository_impl.dart';
import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/hive_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AppBuilder = Future<dynamic> Function({
  required SharedPreferences sharedPreferences,
  required FlutterSecureStorage secureStorage,
  required HiveStorageRepository hiveStorageRepository,
  required FSecureStorageRepository fSecureStorageRepository,
  required NotesRepository notesRepository,
});

void bootstrap(AppBuilder builder) {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreferences = await SharedPreferences.getInstance();
    final secureStorage = FlutterSecureStorage();
    final hiveStorageRepository = HiveStorageRepositoryImpl();
    await hiveStorageRepository.init();
    final fSecureStorageRepository =
        FSecureStorageRepositoryImpl(secureStorage);
    final notesRepository =
        NotesRepositoryImpl(hiveStorageRepository: hiveStorageRepository);
    await notesRepository.initialize();
    runApp(
      await builder(
        sharedPreferences: sharedPreferences,
        secureStorage: secureStorage,
        hiveStorageRepository: hiveStorageRepository,
        fSecureStorageRepository: fSecureStorageRepository,
        notesRepository: notesRepository,
      ),
    );
  }, (e, stacktrace) {
    debugPrint('Error: $e, stacktrace: $stacktrace');
  });
}
