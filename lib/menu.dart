import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/loginForm.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MyMenuState();
}

class _MyMenuState extends State<Menu> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  List<String> listJurusanItems = [
    "Informatika",
    "Teknik Elektro",
    "Teknik Sipil",
    "Teknik Mesin",
    "Teknik Kimia",
  ];
  String valjurusan = "Informatika";

  List<String> listAngkatanItems = [
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
  ];
  String valAngkatan = "2018";

  _getFromGallery() async {
  final XFile? xFile = await picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );

  if (xFile != null) {
    PickedFile pickedFile = PickedFile(xFile.path);
    // Now you can work with the 'pickedFile' of type PickedFile
  } else {
    // Handle the case where no image was picked
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Isi Biodata',
              style: TextStyle(fontSize: 20),
            )),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Lengkap',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Alamat',
              hintMaxLines: 3,
            ),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
          ),
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(3)),
              child: DropdownButton(
                value: valjurusan,
                onChanged: (value) {
                  setState(() {
                    valjurusan = value.toString();
                  });
                },
                items: listJurusanItems.map((itemone) {
                  return DropdownMenuItem(
                    value: itemone,
                    child: Text(itemone),
                  );
                }).toList(),
                isExpanded: true,
                underline: Container(),
              ),
            )),
        Padding(
            padding: EdgeInsets.all(10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(3)),
              child: DropdownButton(
                value: valAngkatan,
                onChanged: (value) {
                  setState(() {
                    valAngkatan = value.toString();
                  });
                },
                items: listAngkatanItems.map((itemtwo) {
                  return DropdownMenuItem(
                    value: itemtwo,
                    child: Text(itemtwo),
                  );
                }).toList(),
                isExpanded: true,
                underline: Container(),
              ),
            )),
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
            _getFromGallery();
            },
          child: Text("PICK FROM GALLERY"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
              child: Text("Simpan Data"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'Data Tersimpan',
                  backgroundColor: Colors.grey,
                );
              }),
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

