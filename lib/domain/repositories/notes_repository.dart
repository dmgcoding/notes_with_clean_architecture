import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/repositories/hive_storage_repository.dart';

abstract class NotesRepository {
  NotesRepository({required this.hiveStorageRepository});
  final HiveStorageRepository hiveStorageRepository;
  Future<void> initialize();
  Future<void> createNote(String title, String content);
  Future<void> updateNote(String id, NoteModel note);
  Future<void> deleteNote(String id);
  Future<List<Note>> getNotes();
}
