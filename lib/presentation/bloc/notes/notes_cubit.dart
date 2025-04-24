import 'package:bloc/bloc.dart';
import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/usecases/delete_note_usecase.dart';
import 'package:clean_arch_test1/domain/usecases/get_notes_usecase.dart';
import 'package:equatable/equatable.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit({
    required this.getNotesUsecase,
    required this.deleteNoteUsecase,
  }) : super(NotesState());

  final GetNotesUsecase getNotesUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;

  Future<void> getNotes() async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await getNotesUsecase.call(null);
      print(result);
      emit(state.copyWith(notes: result, isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorText: e.toString(), isLoading: false));
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await deleteNoteUsecase.call(id);
      getNotes();
    } catch (e) {
      emit(state.copyWith(errorText: e.toString()));
    }
  }
}
