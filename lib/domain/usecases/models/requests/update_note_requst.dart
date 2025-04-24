import 'package:clean_arch_test1/domain/entities/note.dart';

class UpdateNoteRequest {
  final String id;
  final Note note;
  UpdateNoteRequest({required this.id, required this.note});
}
