import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/hitung/hitungluasbangundatar.dart';
import 'package:flutter_application_1/hitung/hitungDiskon.dart';
import 'package:flutter_application_1/hitung/konversisuhu.dart';
import 'package:flutter_application_1/loginForm.dart';

class MyBmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 37, 37, 37),
      ),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 69, 69, 69),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}
