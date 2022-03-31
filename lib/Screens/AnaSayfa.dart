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
          title: new Text("Görev Ekle/Çıkar"),
          content: TextField(
            decoration: InputDecoration(
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
          /*actions: <Widget>[
            Row(
              children: [
                Material(
                  color: const Color(0xff0e877d),
                  child: InkWell(
                    onTap: () {
                      elemanEkle();
                    },
                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Ekle',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: const Color(0xff4a6dd0),
                    child: InkWell(
                      onTap: () {
                        elemanCikar();
                      },
                      child: const SizedBox(
                        height: kToolbarHeight,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Çıkar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],*/
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
      drawer: drawer(),
      appBar: AppBar(
        actions: [
          new SizedBox(
            height: 18.0,
            width: 42.0,
            child: new IconButton(
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
          child: Icon(Icons.add),
          onPressed: () {
            _showDialog();
          }),
      body: Container(
        color: Color(0x46000000),
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
