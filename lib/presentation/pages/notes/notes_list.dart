import 'package:flutter/material.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  static Page<dynamic> page() => MaterialPage(child: NotesListPage());

  @override
  Widget build(BuildContext context) {
    return const _NotesListView();
  }
}

class _NotesListView extends StatelessWidget {
  const _NotesListView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
