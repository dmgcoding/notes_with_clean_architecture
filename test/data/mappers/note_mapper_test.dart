import 'package:clean_arch_test1/data/mappers/note_mapper.dart';
import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('note mapper', () {
    test('should return a valid note object with correct values', () {
      final noteModel = NoteModel(id: '1', title: 'Test', content: 'Test');
      final note = noteFromNoteModel(noteModel);
      expect(note, isA<Note>());
      expect(note.id, '1');
      expect(note.title, 'Test');
      expect(note.content, 'Test');
    });

    test('should return a valid note model object with correct values', () {
      final note = Note(id: '1', title: 'Test', content: 'Test');
      final noteModel = noteModelFromNote(note);
      expect(noteModel, isA<NoteModel>());
      expect(noteModel.id, '1');
      expect(noteModel.title, 'Test');
      expect(noteModel.content, 'Test');
    });
  });
}
