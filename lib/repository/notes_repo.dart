

import 'package:injectable/injectable.dart';

import '../model/note.dart';
import '../objectbox.g.dart';

@Injectable()
class NotesRepo {
  late final Store _store;
  late final Box<Note> _box;

  List<Note> get notes => _box.getAll();

  Future initDB() async {
    _store = await openStore();
    _box = _store.box<Note>();
  }

  Future addNote(Note note) async {
    await _box.putAsync(note);
  }

  Future deleteNote(Note note) async {
    _box.remove(note.id);
  }

  Future updateNote(
      int id,
      Note note) async {
    _box.remove(id);
    await _box.putAsync(note);
  }
}