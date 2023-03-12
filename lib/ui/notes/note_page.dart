import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes/data/entity/note.dart';
import 'package:mobx/mobx.dart';

// import 'package:notes/services/note_repo.dart';
import 'package:notes/ui/notes/note_store.dart';

import '../../data/repository/notes/note_repo.dart';
import '../../di/config.dart';
import '../../domain/model/note.dart';

class NotePage extends StatefulWidget {
  final NoteStore _viewModel = getIt<NoteStore>();
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _viewModel = NoteStore();

  // final _notesRepo = NotesRepo();
  // late var _notes = <Note>[];

  @override
  void initState() {
    super.initState();

    _viewModel.init();
    // _notesRepo
    //     .initDB();
    // .whenComplete(() => setState(() => _notes = _notesRepo.notes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
      ),
      body: Observer(builder: (_) {
        // final data = _notesRepo.notes;

        return ListView.builder(
          itemCount: _viewModel.value.length,
          itemBuilder: ((_, i) => ListTile(
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEdit(_viewModel.value[i]);
                      },
                    ),
                    IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // setState(() {
                          _viewModel.deleteNote(_viewModel.value[i]);
                          // _notes = _notesRepo.notes;
                        }
                        // );
                        // },
                        ),
                  ],
                ),
                title: Text(_viewModel.value[i].name),
                subtitle: Text(_viewModel.value[i].description),
              )),
        );
      }),
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
                    await _viewModel.addNote(Note(id: 0, name: nameController.text, description: descriptionController.text)
                   );

                    Navigator.pop(context);
                    // },
                    // );
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
                      await _viewModel.updateNote(
                        note.id,
                        Note(
                          name: nameController.text,
                          description: descriptionController.text,
                          id: 0,
                        ),
                      );

                      // setState(
                      //   () {
                      //     _notes = _notesRepo.notes;
                      Navigator.pop(context);
                    },
                    // );
                    // },
                    child: const Text('Изменить'),
                  ),
                ],
              ),
            ],
          );
        },
      );
}
