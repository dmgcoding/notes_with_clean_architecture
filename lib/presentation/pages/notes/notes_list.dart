import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:clean_arch_test1/domain/usecases/add_note_usecase.dart';
import 'package:clean_arch_test1/domain/usecases/delete_note_usecase.dart';
import 'package:clean_arch_test1/domain/usecases/get_notes_usecase.dart';
import 'package:clean_arch_test1/presentation/bloc/notes/notes_cubit.dart';
import 'package:clean_arch_test1/presentation/widgets/dialogs/add_new_note.dart';
import 'package:clean_arch_test1/presentation/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  static Page<dynamic> page() => MaterialPage(child: NotesListPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(
        getNotesUsecase:
            GetNotesUsecase(notesRepository: context.read<NotesRepository>()),
        deleteNoteUsecase:
            DeleteNoteUsecase(notesRepository: context.read<NotesRepository>()),
      ),
      child: const _NotesListView(),
    );
  }
}

class _NotesListView extends StatelessWidget {
  const _NotesListView();

  Future<void> _showAddNoteDialog(BuildContext context) async {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final addNoteUsecase =
        AddNoteUsecase(notesRepository: context.read<NotesRepository>());
    await showDialog(
      context: context,
      builder: (context) => AddNewNoteDialog(
        titleController: titleController,
        contentController: contentController,
        addNoteUsecase: addNoteUsecase,
      ),
    );
    if (context.mounted) {
      await context.read<NotesCubit>().getNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () => context
                .read<AuthStatusCubit>()
                .updateStatus(AuthStatusState.unauthenticated),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorText != null) {
            return Center(child: Text(state.errorText!));
          }
          if (state.notes.isEmpty) {
            return const Center(child: Text('No notes found'));
          }
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(note: state.notes[index]);
            },
          );
        },
      ),
    );
  }
}
