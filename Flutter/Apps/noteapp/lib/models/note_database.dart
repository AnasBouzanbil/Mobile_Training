import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:noteapp/models/note.dart';
import 'package:path_provider/path_provider.dart';
class NoteDatabase  extends ChangeNotifier{
  static late Isar isar;

  static Future<void> initliaze() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(

        [NoteSchema],
        directory: dir.path);
  }
  final List<Note> currentNOte = [];

  Future<void> addNote(String note) async{
    final newNote = Note()..text = note;
    await isar.writeTxn(()=>isar.notes.put(newNote));
    featchNotes();
  }

  Future<void> featchNotes() async {
List<Note> featchedNotes = await isar.notes.where().findAll();
currentNOte.clear();
currentNOte.addAll(featchedNotes);
  }

  Future<void> updateNotes(int id, String newNote) async {
    final existnaseid = await isar.notes.get(id);
    if (existnaseid != null)
      existnaseid.text = newNote;
    await isar.writeTxn(()=>isar.notes.put(existnaseid!));
    await featchNotes();
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(()=> isar.notes.delete(id));
    await featchNotes();
  }
}