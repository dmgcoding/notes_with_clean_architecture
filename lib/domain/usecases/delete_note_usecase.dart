import 'package:clean_arch_test1/core/usecase/usecase.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';

class DeleteNoteUsecase extends Usecase<void, String> {
  final NotesRepository notesRepository;
  DeleteNoteUsecase({required this.notesRepository});
  @override
  Future<void> call(String request) async =>
      await notesRepository.deleteNote(request);
}
