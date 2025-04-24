import 'package:clean_arch_test1/domain/entities/note.dart';
import 'package:clean_arch_test1/domain/usecases/add_note_usecase.dart';
import 'package:clean_arch_test1/presentation/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

class AddNewNoteDialog extends StatelessWidget {
  const AddNewNoteDialog({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.addNoteUsecase,
  });
  final AddNoteUsecase addNoteUsecase;

  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormInputField(
            onChanged: (val) => titleController.text = val,
            labelText: 'Email',
            errorText: null,
          ),
          const SizedBox(height: 16),
          FormInputField(
            onChanged: (val) => contentController.text = val,
            labelText: 'Email',
            errorText: null,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (titleController.text.isNotEmpty &&
                contentController.text.isNotEmpty) {
              try {
                final note = Note(
                  title: titleController.text,
                  content: contentController.text,
                );
                await addNoteUsecase.call(note);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                debugPrint(e.toString());
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
              }
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
