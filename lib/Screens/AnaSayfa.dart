import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/anaSayfaDrawer.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/service/todoService.dart';
import '../service/auth.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  TodoService _todoService= TodoService();
  TextEditingController todos = TextEditingController();
  List<Todo> yapilacaklarListesi = [];

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Görev Ekle/Çıkar"),
          content: TextField(
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              labelText: "Görevlerinizi buraya yazabilirsiniz",
              labelStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
            ),
            controller: todos,
          ),
          actions: [
            CupertinoButton(
                onPressed: () {
                  _todoService.addTodo(todos.text);
                  elemanEkle();
                },
                child: Text('Ekle'))
          ],
        );
      },
    );
  }

  elemanEkle() {
    setState(() {
      yapilacaklarListesi.add(Todo(id: yapilacaklarListesi.toString(), title: todos.text));
      todos.clear();
    });
  }

  elemanCikar() {
    setState(() {
      yapilacaklarListesi.remove(Todo(id:yapilacaklarListesi.toString(), title:todos.text));
      todos.clear();
    });
  }

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: AppBar(
        actions: [
          SizedBox(
            height: 18.0,
            width: 42.0,
            child: IconButton(
              onPressed: () {
                _authService.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout),
              iconSize: 30,
            ),
          )
        ],
        title: const Text('Yapılacaklar Listesi'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _showDialog();
          }),
      body: Container(
        color: const Color(0x46000000),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: yapilacaklarListesi.length,
                itemBuilder: (context, indexNumarasi) => Card(
                    child: InkWell(
                  child: TextButton(
                      onLongPress: () {
                        setState(
                          () {
                            yapilacaklarListesi.removeAt(indexNumarasi);
                          },
                        );
                      },
                      onPressed: () {},
                      child: ListTile(
                        title: Text(yapilacaklarListesi[indexNumarasi].title),
                      )),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
