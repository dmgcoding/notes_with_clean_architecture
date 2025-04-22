import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:clean_arch_test1/domain/repositories/hive_storage_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageBox {
  static const notesBox = 'notes';
}

class HiveStorageRepositoryImpl extends HiveStorageRepository {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    //register adapters
    Hive.registerAdapter(NoteModelAdapter());
  }

  @override
  Future<void> deleteBox(String name) async {
    try {
      await Hive.deleteBoxFromDisk(HiveStorageBox.notesBox);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Box<T>> getBox<T>(String name) {
    switch (name) {
      case HiveStorageBox.notesBox:
        return Hive.openBox<T>(HiveStorageBox.notesBox);
      default:
        throw Exception('Box not found');
    }
  }
}
