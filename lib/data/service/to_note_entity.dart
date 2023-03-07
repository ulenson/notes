



import '../../domain/model/note.dart';
import '../entity/note.dart';

extension NoteToNoteEntity on Note {
  NoteEntity toEntity() => NoteEntity(name: name, description: description);
}