import 'package:flutter/material.dart';
// import 'package:notes/screens/note_page.dart';
import 'package:notes/ui/notes/note_page.dart';

import 'di/config.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotePage(
        // title: 'Заметки',
      ),
    );
  }
}
