import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('note model', () {
    test('should return a valid note model', () {
      final note = NoteModel(id: '1', title: 'Test', content: 'Test');
      expect(note, isA<NoteModel>());
    });

    test('copyWith should return a new note model with the updated values', () {
      final note = NoteModel(id: '1', title: 'Test', content: 'Test');
      final updatedNote =
          note.copyWith(id: '2', title: 'Updated', content: 'Updated');
      expect(updatedNote.id, '2');
      expect(updatedNote.title, 'Updated');
      expect(updatedNote.content, 'Updated');
    });
    test('should return true if all properties are the same', () {
      final note1 = NoteModel(id: '1', title: 'Test', content: 'Test');
      final note2 = NoteModel(id: '1', title: 'Test', content: 'Test');
      expect(note1 == note2, true);
    });
  });
}
