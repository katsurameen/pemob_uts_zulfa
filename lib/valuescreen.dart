import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/hitung/hitungluasbangundatar.dart';
import 'package:flutter_application_1/hitung/hitungDiskon.dart';
import 'package:flutter_application_1/hitung/konversisuhu.dart';
import 'package:flutter_application_1/loginForm.dart';

class SendValue extends StatelessWidget {
  const SendValue({super.key});

  static const String _title = 'Send Data';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const _MySendValueState(),
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
                        builder: ((context) => const Navigasi())));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalcPage()));
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
        //generate list
      ),
    );
  }
}

class Person {
  final String name;
  final String age;

  Person(this.name, this.age);
}

class _MySendValueState extends StatelessWidget {
  const _MySendValueState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: Text('Send Data'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreenWithData(
                          person: new Person("Zulfa Sulthany", "20"))));
            },
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: new Text('Back'),
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Navigasi()));
              }),
            )),
      ],
    );
  }
}

class SecondScreenWithData extends StatelessWidget {
  final Person person;

  SecondScreenWithData({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen With Data"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("Data Orang \nNama: ${person.name} \nUmur: ${person.age}"),
          ],
        ),
      ),
    );
  }
}
