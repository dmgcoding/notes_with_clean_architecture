import 'package:clean_arch_test1/data/mappers/note_mapper.dart';
import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:clean_arch_test1/data/repositories/hive_storage_repository_impl.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class NotesRepositoryImpl extends NotesRepository {
  NotesRepositoryImpl({required super.hiveStorageRepository});
  Box<NoteModel>? _notesBox;

  @override
  Future<void> initialize() async {
    _notesBox =
        await hiveStorageRepository.getBox<NoteModel>(HiveStorageBox.notesBox);
  }

  @override
  Future<List<Note>> getNotes() async {
    try {
      if (_notesBox == null) {
        throw Exception('Notes box not initialized');
      }
      return _notesBox!.values
          .map((model) => noteFromNoteModel(model))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createNote(String title, String content) async {
    try {
      if (_notesBox == null) {
        throw Exception('Notes box not initialized');
      }
      final id = Uuid().v4();
      final note = NoteModel(id: id, title: title, content: content);
      await _notesBox!.put(id, note);
      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      if (_notesBox == null) {
        throw Exception('Notes box not initialized');
      }

      await _notesBox!.delete(id);
      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNote(String id, Note note) async {
    try {
      if (_notesBox == null) {
        throw Exception('Notes box not initialized');
      }
      _notesBox!.put(id, noteModelFromNote(note));
      return;
    } catch (e) {
      rethrow;
    }
  }
}
