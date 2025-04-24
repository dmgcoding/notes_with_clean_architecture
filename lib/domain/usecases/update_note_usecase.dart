import 'package:clean_arch_test1/core/usecase/usecase.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:clean_arch_test1/domain/usecases/models/requests/update_note_requst.dart';

class UpdateNoteUsecase extends Usecase<void, UpdateNoteRequest> {
  final NotesRepository notesRepository;
  UpdateNoteUsecase({required this.notesRepository});
  @override
  Future<void> call(UpdateNoteRequest request) async =>
      await notesRepository.updateNote(request.id, request.note);
}
