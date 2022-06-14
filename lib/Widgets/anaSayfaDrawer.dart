import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todoapp/Widgets/dividerWidget.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  void cikisSorgu() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('ÇIKIŞ!'),
        content: const Text('Çıkmak istediğinize emin misiniz?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'İptal'),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, exit(0)),
            child: const Text('Evet, eminim!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset('images/todo.jpg')),
          ListTile(
              leading: Icon(Icons.home_sharp, color: Colors.black),
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pushNamed(context, '/anasayfa');
              }),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Ayarlar'),
              onTap: () {
                Navigator.pushNamed(context, '/ayarlar');
              }),
          ListTile(
              leading: Icon(Icons.contact_page, color: Colors.black),
              title: Text('İletişim'),
              onTap: () {
                Navigator.pushNamed(context, '/iletisim');
              }),
          ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text('Hakkında'),
              onTap: () {
                Navigator.pushNamed(context, '/hakkinda');
              }),
          dividerWidget(),
          ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text('Çıkış Yap'),
              onTap: () {
                cikisSorgu();
              }),
        ],
      ),
    );
  }
}
