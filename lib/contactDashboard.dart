import "package:flutter/material.dart";

class MyContactPage extends StatelessWidget {
  const MyContactPage({super.key});

  final title = 'Contact List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              minVerticalPadding: 2.0,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
              ),
              title: Text('Zulfa Sulthany Almawhib'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            new Divider(
              height: 2.0,
              indent: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
