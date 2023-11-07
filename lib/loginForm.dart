import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:flutter_application_1/menu.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
        //generate list
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (nameController.text == 'Zulfa' &&
                        passwordController.text == 'zulfa123') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navigasi()));
                    }
                  },
                )),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  //register
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
              ),
            )
          ],
        ));
  }
}
