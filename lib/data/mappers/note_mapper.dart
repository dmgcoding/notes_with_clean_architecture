import 'package:clean_arch_test1/data/models/note_model.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';

Note noteFromNoteModel(NoteModel noteModel) {
  return Note(
    id: noteModel.id,
    title: noteModel.title,
    content: noteModel.content,
  );
}

NoteModel noteModelFromNote(Note note) {
  return NoteModel(
    id: note.id,
    title: note.title,
    content: note.content,
  );
}
