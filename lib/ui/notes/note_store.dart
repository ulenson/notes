import 'package:mobx/mobx.dart';
import 'package:notes/data/entity/note.dart';
import 'package:notes/domain/interactor/notes.dart';
// import 'package:notes/services/note_repo.dart';

import '../../data/repository/notes/note_repo.dart';
import '../../domain/model/note.dart';

part 'note_store.g.dart'; // Указание для кодогенерации

/// HomeStore — Store, который будет использовать View. Своего рода это ViewModel.
/// _HomeStore — Наша реализация Store, _$HomeStore — Store, который
/// будет создан магической кодогенерацией :)
 class NoteStore = _NoteStore with _$NoteStore;

 class _NoteStore with Store {
  final _notesInteractor = NotesInteractor();
  // final NotesRepo _notesRepo;

  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  List<Note> value = [];

  // Action — метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  Future init() async {
    await _notesInteractor.init()

    ;

  }
  @action
  Future addNote(Note note) => _notesInteractor.addNote(note);

  @action
  deleteNote(Note note) => _notesInteractor.deleteNote(note);

  @action
  Future updateNote( int id,Note note) => _notesInteractor.updateNote(id, note);





}