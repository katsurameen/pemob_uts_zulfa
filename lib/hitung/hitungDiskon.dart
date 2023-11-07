import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/valuescreen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/hitung/kalkulator.dart';
import 'package:flutter_application_1/hitung/bmiCalculator.dart';
import 'package:flutter_application_1/hitung/hitungluasbangundatar.dart';
import 'package:flutter_application_1/hitung/konversisuhu.dart';
import 'package:flutter_application_1/loginForm.dart';

class MyDiscount extends StatelessWidget {
  MyDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HitungDiskon(),
    );
  }
}

class HitungDiskon extends StatefulWidget {
  const HitungDiskon({super.key});

  @override
  State<HitungDiskon> createState() => _MyHitungDiskon();
}

class _MyHitungDiskon extends State<HitungDiskon> {
  var totalprice = '0';
  var discount = '0';
  var discountprice;
  var saved;
  var priceController = TextEditingController();
  var discountController = TextEditingController();

  var showTotalPrice = "";
  var showDiscount = "";

  var listOfDiscounts = [];

  @override
  void initState() {
    super.initState();
    print("yolo: $listOfDiscounts");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  _calculate(totalprice, discount) {
    totalprice = double.parse(totalprice);
    discount = double.parse(discount);
    var cal = (discount * totalprice) / 100;
    discountprice = totalprice - cal;
    return discountprice;
  }

  double _calculateAmountSaved(totalprice, discountprice) {
    totalprice = double.parse(totalprice);
    double saved = totalprice - discountprice;
    return saved;
  }

  _savedButton(showtotalprice, showdiscount, discountprice, saved) {
    listOfDiscounts.add({
      "Price": showtotalprice,
      "Discount": showdiscount,
      "Discounted Price": discountprice,
      "Saved": saved,
    });

    print("list $listOfDiscounts");
    print("list item types : ${listOfDiscounts[0]["Price"]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Diskon'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(children: <Widget>[
            Material(
              elevation: 10.0,
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90), //Not Working
                  ),
                  hintText: "Enter Price",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                // onChanged: (text) {
                //   totalprice = text;
                // },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              elevation: 10.0,
              child: TextField(
                controller: discountController,
                keyboardType: TextInputType.number,
                style: TextStyle(),
                decoration: InputDecoration(
                    hintText: "Enter Discount",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
                // onChanged: (text) {
                //   print("price: controller:  ${priceController.text}");
                //   discount = text;
                // },
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            ButtonTheme(
              minWidth: 120,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  'Discount',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  print("price controller: ${priceController.text}");
                  showTotalPrice = priceController.text;
                  showDiscount = discountController.text;

                  discountprice =
                      _calculate(priceController.text, discountController.text);

                  saved = _calculateAmountSaved(
                      priceController.text, discountprice);
                  priceController.clear();
                  discountController.clear();
                  print(priceController.text);
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 370.0,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Calculations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Price: " +
                                  (showTotalPrice ==
                                          "" // Ambigious logic but working
                                      ? ""
                                      : "Rp. $showTotalPrice"),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Discount: " +
                                  (showDiscount == "" ? " " : "$showDiscount%"),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              discountprice == null
                                  ? "Discounted Price: "
                                  : "Discounted Price: $discountprice",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              saved == null ? "Saved: " : "Saved Rp: $saved",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              minWidth: 130,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print("List before call: $listOfDiscounts");
                  _savedButton(
                      showTotalPrice, showDiscount, discountprice, saved);
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ])),
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
}
