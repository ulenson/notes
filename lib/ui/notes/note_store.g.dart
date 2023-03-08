// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStore, Store {
  late final _$valueAtom = Atom(name: '_NoteStore.value', context: context);

  @override
  List<Note> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<Note> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_NoteStore.init', context: context);

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_NoteStoreActionController =
      ActionController(name: '_NoteStore', context: context);

  @override
  Future<dynamic> addNote(Note note) {
    final _$actionInfo =
        _$_NoteStoreActionController.startAction(name: '_NoteStore.addNote');
    try {
      return super.addNote(note);
    } finally {
      _$_NoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteNote(Note note) {
    final _$actionInfo =
        _$_NoteStoreActionController.startAction(name: '_NoteStore.deleteNote');
    try {
      return super.deleteNote(note);
    } finally {
      _$_NoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> updateNote(int id, Note note) {
    final _$actionInfo =
        _$_NoteStoreActionController.startAction(name: '_NoteStore.updateNote');
    try {
      return super.updateNote(id, note);
    } finally {
      _$_NoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
