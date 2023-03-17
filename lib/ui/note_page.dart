import 'package:flutter/material.dart';
import 'package:notes/model/note.dart';

import '../repository/notes_repo.dart';



class NotePage extends StatefulWidget {
  const NotePage({Key? key, required String title}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _notesRepo = NotesRepo();
  late var _notes = <Note>[];

  @override
  void initState() {
    super.initState();
    _notesRepo
        .initDB()
        .whenComplete(() => setState(() => _notes = _notesRepo.notes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: ((_, i) => ListTile(
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _showEdit(_notes[i]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _notesRepo.deleteNote(_notes[i]);
                        _notes = _notesRepo.notes;
                      });
                    },
                  ),
                ],
              ),
              title: Text(_notes[i].name),
              subtitle: Text(_notes[i].description),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => _showDialog()), child: const Icon(Icons.add)),
    );
  }

  Future _showDialog() => showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController();
          final descriptionController = TextEditingController();
          return AlertDialog(
            title: const Text('Новая заметка'),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Название'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: 'Описание'),
                ),
              ],
            ),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Отменить'),
                ),
                TextButton(
                  onPressed: (() async {
                    await _notesRepo.addNote(
                      Note(
                        name: nameController.text,
                        description: descriptionController.text,
                      ),
                    );
                    setState(
                      () {
                        _notes = _notesRepo.notes;
                        Navigator.pop(context);
                      },
                    );
                  }),
                  child: const Text('Добавить'),
                ),
              ]),
            ],
          );
        },
      );

  Future _showEdit(Note note) => showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController(text: note.name);
          final descriptionController =
              TextEditingController(text: note.description);
          return AlertDialog(
            title: const Text('Изменить'),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Название'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: 'Описание'),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Отменить'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await _notesRepo.updateNote(
                        note.id,
                        Note(
                          name: nameController.text,
                          description: descriptionController.text,
                        ),
                      );

                      setState(
                        () {
                          _notes = _notesRepo.notes;
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: const Text('Изменить'),
                  ),
                ],
              ),
            ],
          );
        },
      );
}
