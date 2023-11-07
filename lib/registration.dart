import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/loginForm.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Pendaftaran',
              style: TextStyle(fontSize: 20),
            )),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Reenter Password',
          )),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Notification'),
                      content: Text('Selamat Akun Telah Berhasil Dibuat'),
                      actions: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Continue'))
                      ],
                    );
                  });
            },
            child: Text('Daftar Sekarang'),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(1),
            child: TextButton(
              child: Text('Kembali'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginForm()));
              },
            ))
      ])),
    );
  }
}
