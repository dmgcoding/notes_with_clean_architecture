import 'package:clean_arch_test1/core/usecase/usecase.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';

class AddNoteUsecase extends Usecase<void, Note> {
  final NotesRepository notesRepository;
  AddNoteUsecase({required this.notesRepository});
  @override
  Future<void> call(Note request) async =>
      await notesRepository.createNote(request.title, request.content);
}
