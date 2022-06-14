import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/todo.dart';

class TodoService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Todo>addTodo(String title)async{
    var ref = _firestore.collection("todo");
    var documentRef= await ref.add(
      {
        'title' : title,
      }
    );
    return Todo(id: documentRef.id, title:title );
  }
  Future<void> removeTodo(String titleId) {
    var ref = _firestore.collection("todo").doc(titleId).delete();
    return ref;
  }
}