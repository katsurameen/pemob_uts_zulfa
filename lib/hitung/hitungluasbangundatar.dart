import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/hitung/hitungDiskon.dart';
import 'package:flutter_application_1/hitung/konversisuhu.dart';
import 'package:flutter_application_1/loginForm.dart';

class Myluas extends StatelessWidget {
  const Myluas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HitungLuas(),
    );
  }
}

class HitungLuas extends StatefulWidget {
  @override
  State<HitungLuas> createState() => _LuasState();
}

class _LuasState extends State<HitungLuas> {
  final TextEditingController _panjang = TextEditingController();
  final TextEditingController _lebar = TextEditingController();
  final TextEditingController _alas = TextEditingController();
  final TextEditingController _tinggi = TextEditingController();
  final TextEditingController _jarijari = TextEditingController();

  double _result = 0;
  double _result2 = 0;
  double _result3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Bangun Datar'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text('Persegi Panjang'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _panjang,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang (cm)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _lebar,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Lebar (cm)',
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: hitungPersegi,
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Enter Value"
                    : "${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Segitiga'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _alas,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Alas (cm)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _tinggi,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: hitungSegitiga,
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Enter Value"
                    : "${_result2.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Lingkaran'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _jarijari,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jari-Jari',
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: hitungLingkaran,
              ),
              SizedBox(height: 15),
              Text(
                _result == null
                    ? "Enter Value"
                    : "${_result3.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Navigasi())));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyTemp1()));
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

  void hitungPersegi() {
    double panjang = double.parse(_panjang.text);
    double lebar = double.parse(_lebar.text);

    double result = panjang * lebar;
    _result = result;
    setState(() {});
  }

  void hitungSegitiga() {
    double alas = double.parse(_alas.text);
    double tinggi = double.parse(_tinggi.text);

    double result1 = 1.0 / 2.0 * alas * tinggi;
    _result2 = result1;
    setState(() {});
  }

  void hitungLingkaran() {
    double jari = double.parse(_jarijari.text);

    double result2 = 22.0 / 7.0 * (jari * jari);
    _result3 = result2;
    setState(() {});
  }
}
