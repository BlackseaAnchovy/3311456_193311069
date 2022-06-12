import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/anaSayfaDrawer.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  TextEditingController t1 = TextEditingController();
  List yapilacaklarListesi = [];

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
            controller: t1,
          ),
          actions: [
            ElevatedButton(onPressed: (){
              elemanEkle();
            }, child: Text('Ekle'))
          ],
        );
      },
    );
  }

  elemanEkle() {
    setState(() {
      yapilacaklarListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      yapilacaklarListesi.remove(t1.text);
      t1.clear();
    });
  }

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
                        onPressed: () {
                          setState(
                                () {
                              yapilacaklarListesi.removeAt(indexNumarasi);
                            },
                          );
                        },
                        child: ListTile(
                          title: Text(yapilacaklarListesi[indexNumarasi]),
                        )),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
