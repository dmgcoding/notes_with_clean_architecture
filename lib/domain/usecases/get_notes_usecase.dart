import 'package:clean_arch_test1/core/usecase/usecase.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';

class GetNotesUsecase extends Usecase<List<Note>, void> {
  final NotesRepository notesRepository;
  GetNotesUsecase({required this.notesRepository});
  @override
  Future<List<Note>> call(dynamic request) async =>
      await notesRepository.getNotes();
}
