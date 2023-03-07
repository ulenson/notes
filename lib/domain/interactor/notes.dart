import 'package:notes/data/entity/note.dart';
import 'package:notes/data/repository/notes/note_repo.dart';


import '../model/note.dart';

class NotesInteractor {
  final  _repo = NotesRepo();


  List get notes => _repo.notes;


  Future updateNote(
    int id,
    Note note,
  ) =>
      _repo.updateNote(id, note);

  Future deleteNote(Note note) => _repo.deleteNote(note);

  Future init() => _repo.initDB()

  ;

  Future addNote(Note note) => _repo.addNote(note);
}
