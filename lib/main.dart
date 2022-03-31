import 'package:flutter/material.dart';
import 'package:todoapp/Screens/AnaSayfa.dart';
import 'package:todoapp/Screens/Ayarlar.dart';
import 'package:todoapp/Screens/GirisEkrani.dart';
import 'package:todoapp/Screens/hakkinda.dart';
import 'package:todoapp/Screens/iletisim.dart';
import 'package:todoapp/Screens/splashScreen.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => splashScreen(),
        "/giris":(context)=>GirisEkrani(),
        "/anasayfa":(context) => AnaSayfa(),
        "/ayarlar":(context)=>Ayarlar(),
        "/iletisim":(context)=>iletisim(),
        "/hakkinda":(context)=>hakkinda(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
      ),

    );
  }
}



