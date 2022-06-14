import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class hakkinda extends StatefulWidget {
  const hakkinda({Key? key}) : super(key: key);

  @override
  State<hakkinda> createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {

  void yonlendir(command) async{
    if(await canLaunch(command))
    {
      await launch(command);
    }
    else{
      print("$command bulunamadı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hakkında'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 130,),
            Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Text("Bu proje DR. ÖĞR. ÜYESİ Ahmet Cevahir ÇINAR'ın vermiş olduğu 3311456 Kodlu mobil programlama dersi için Hilmi KIRKGÖZ tarafından geliştirilmiştir."),
            ),
            InkWell(
              onTap: (){
                yonlendir("https://www.ahmetcevahircinar.com.tr/");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width/5,
                padding: EdgeInsets.all(13),
                child: Center(child: Text('Link')),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
