


import '../../domain/model/note.dart';
import '../entity/note.dart';

extension NoteEntityToNote on NoteEntity {
  Note toNote() => Note(id: id, name: name, description: description);
}