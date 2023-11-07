import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/hitung/hitungluasbangundatar.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/post_card.dart';
import 'package:flutter_application_1/hitung/hitungDiskon.dart';
import 'package:flutter_application_1/hitung/konversisuhu.dart';
import 'package:flutter_application_1/loginForm.dart';

class Navigasi extends StatelessWidget {
  const Navigasi({super.key});

  static const apptitle = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: apptitle,
      home: Dashboard(title: apptitle),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => PostCard(),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Navigasi')),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Menu'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Dashboard(title: title))));
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_file),
            title: const Text('Input Data'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Menu())));
            },
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: const Text('Send Data'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SendValue()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Kalkulator'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CalcPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('BMI Calculator'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyBmi()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Hitung Bangun Datar'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Myluas()));
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: const Text('Hitung Diskon'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyDiscount()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Konversi Suhu'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyTemp1()));
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginForm()));
            },
          ),
        ],
      )),
    );
  }
}
