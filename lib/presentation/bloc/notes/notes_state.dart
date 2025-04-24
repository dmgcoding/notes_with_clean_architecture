part of 'notes_cubit.dart';

class NotesState extends Equatable {
  const NotesState({
    this.notes = const [],
    this.errorText,
    this.isLoading = false,
  });
  final List<Note> notes;
  final String? errorText;
  final bool isLoading;

  NotesState copyWith({
    List<Note>? notes,
    String? errorText,
    bool? isLoading,
  }) {
    return NotesState(
        notes: notes ?? this.notes,
        errorText: errorText ?? this.errorText,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [notes, errorText ?? '', isLoading];
}
