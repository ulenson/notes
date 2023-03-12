import 'package:injectable/injectable.dart';
import 'package:notes/data/service/to_note.dart';
import 'package:notes/data/service/to_note_entity.dart';
import 'package:notes/domain/model/note.dart';

import 'package:notes/domain/model/note.dart';
import '../../entity/note.dart';
import '../../../objectbox.g.dart';
@lazySingleton
class NotesRepo {
  late final Store _store;
  late final Box<NoteEntity> _box;

  List get notes => _box.getAll().map((e) => e.toNote()).toList();

  Future initDB() async {
    _store = await openStore();
    _box = _store.box<NoteEntity>();
  }

  Future addNote(Note note) async {
    await _box.putAsync(note.toEntity());
  }

  Future deleteNote(Note note) async {
    _box.remove(note.id);
  }

  Future updateNote(
    int id,
    Note note,
  ) async {
    _box.remove(id);
    await _box.putAsync(note.toEntity());
  }
}
