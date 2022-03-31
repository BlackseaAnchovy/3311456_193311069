import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds:1),(){
    Navigator.pushReplacementNamed(context, '/giris');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF517961),
      body: SafeArea(

        child: Center(
          child: Container(

            child: InkWell(
              child: Image.asset('images/nothing.jpg'),
            ),
            ),
        ),
        ),
      );

  }
}
