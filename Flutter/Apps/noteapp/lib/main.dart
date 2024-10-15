import 'package:flutter/material.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:noteapp/pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initliaze();
  runApp(ChangeNotifierProvider(
    create: (context) => NoteDatabase(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    home: Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text("dddddddd"),
      ),
    ),
  );
}
}
