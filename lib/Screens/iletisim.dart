import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'
;
class iletisim extends StatelessWidget {
  const iletisim({Key? key}) : super(key: key);

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
      appBar: AppBar(title: Text('iletişim'),),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bize Ulaşın'),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                yonlendir("mailto:hilmikirkgoz@gmail.com");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width/5,
                padding: EdgeInsets.all(13),
                child: Center(child: Text('Mail')),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                yonlendir("tel: +905373439356");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width/5,
                padding: EdgeInsets.all(13),
                child: Center(child: Text('Telefon')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
