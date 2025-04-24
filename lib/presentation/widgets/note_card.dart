import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/presentation/bloc/notes/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      trailing: IconButton(
        onPressed: () => context.read<NotesCubit>().deleteNote(note.id),
        icon: Icon(Icons.delete),
      ),
    );
  }
}
