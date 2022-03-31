import 'package:flutter/material.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final _formKey=GlobalKey<FormState>();
  var username;
  var password;
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child:Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0,left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                ),
                validator: (deger) {
                  if (deger==null || deger.isEmpty) {
                    return 'Lütfen kullanıcı adınızı giriniz';
                  }
                  return null;
                },
                onSaved: (deger){
                  username=deger;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                ),
                validator: (deger) {
                  if (deger==null || deger.isEmpty) {
                    return 'Lütfen şifrenizi giriniz';
                  }
                  return null;
                },
                onSaved: (deger){
                  password=deger;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      child: Text('Üye Ol'),
                      onPressed:(){}),
                  MaterialButton(
                      child: Text('Şifremi Unuttum'),
                      onPressed:(){}),
                ],
              ),
              _loginButton()
            ],
          ),
        ),
      ) , )
    );
  }
  Widget _loginButton()=>
      ElevatedButton(onPressed: (){
        if(_formKey.currentState!.validate()){
           _formKey.currentState?.save();
           if(username=="a"&&password=="a"){
             Navigator.pushReplacementNamed(context, "/anasayfa");
           }else{
             showDialog(
               barrierDismissible: false,
               context: context,
               builder: (BuildContext context){
                 return AlertDialog(
                   title: Text('Hata'),
                   content: Text('Giriş Bilgileriniz Hatalı'),
                   actions: [
                     MaterialButton(child: Text('Geri Dön'),onPressed: (){Navigator.pop(context);
                     }),
                   ],
                 );
               }

             );
           }
        }
      },
        child: Text('Giriş Yap'), );
}

