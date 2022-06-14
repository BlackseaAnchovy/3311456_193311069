import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;

  Todo({required this.id, required this.title});

  factory Todo.formSnapshot(DocumentSnapshot snapshot) {
    return Todo(id: snapshot.id, title: snapshot["Todo"]);
  }
}
