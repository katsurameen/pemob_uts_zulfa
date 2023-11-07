import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/loginForm.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/hitung/hitungluasbangundatar.dart';
import 'package:flutter_application_1/hitung/hitungDiskon.dart';

class MyTemp1 extends StatefulWidget {
  const MyTemp1({super.key});

  @override
  State<MyTemp1> createState() => _MyTemp1State();
}

class _MyTemp1State extends State<MyTemp1> {
  TextEditingController tIn = new TextEditingController();

  void _clearText() {
    tIn.clear();
  }

  int val = 0;
  int groupValue = 0;
//  bool ftc = false;
//  bool ctf = false;
  String finalAnswer = '';

  handleTemperature(int value) {
    setState(() {
      if (value == 1) {
        //fahrenheit to celsius
        groupValue = 1;
//        ctf = false;
//        ftc = true;
        var ans = (val - 32.0) / 1.8;
        finalAnswer = ans.toString() + " C";
      } else if (value == 2) {
        //celsius to fahrenheit
        groupValue = 2;
//        ctf = true;
//        ftc = false;
        var ans = (val * 1.8) + 32;
        finalAnswer = ans.toString() + " F";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
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
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: tIn,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Temp'),
              onChanged: (String value) {
                val = int.parse(value);
              },
            ),
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.red,
                value: 1,
                groupValue: groupValue,
                onChanged: (e) => handleTemperature(e!),
              ),
              Text("Convert to C"),
              SizedBox(
                height: 5,
              ),
              Radio(
                activeColor: Colors.red,
                value: 2,
                groupValue: groupValue,
                onChanged: (e) => handleTemperature(e!),
              ),
              Text('Convert to F'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text('Clear'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    _clearText();
                    setState(() {
                      finalAnswer = '';
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(finalAnswer == null ? '' : finalAnswer)
              ],
            ),
          )
        ],
      ),
    );
  }
}
