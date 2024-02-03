import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_bank/controllers/screens/account_screen.dart';
import 'package:qr_bank/controllers/screens/data_screen.dart';
import 'package:qr_bank/controllers/screens/help_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int qrNumber = 0;
  String qrCode = '';
  List qrSerials = [];

  String generateCode() {
    const String letters = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    String code = '';

    for (int i = 0; i < 8; i++) {
      if (i % 2 == 0) {
        // Add a random letter
        int randomIndex = Random().nextInt(letters.length);
        code += letters[randomIndex];
      } else {
        // Add a random number
        int randomIndex = Random().nextInt(numbers.length);
        code += numbers[randomIndex];
      }
    }

    return code;
  }

  getQRCode() {
    for (int i = 0; i < qrNumber; i++) {
      qrSerials.add(generateCode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.camera_alt_rounded),
            ),
            accountName: Text(
              'Khadija Barhou',
            ),
            accountEmail: Text(
              'kbarhou@devx.net',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountScreen()));
            },
            leading: Icon(
              Icons.account_circle_rounded,
              size: 18.0,
              color: Colors.black87,
            ),
            title: Text(
              'My Account',
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataScreen()));
            },
            leading: Icon(
              Icons.qr_code,
              size: 18.0,
              color: Colors.black87,
            ),
            title: Text(
              'QR Bank List',
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings_rounded,
              size: 18.0,
              color: Colors.grey,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
            leading: Icon(
              Icons.help,
              size: 18.0,
              color: Colors.grey,
            ),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 14.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ),
        ],
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'QR Generator',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.online_prediction_rounded),
          SizedBox(
            width: 16.0,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        qrNumber++;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              48.0,
                            ),
                            bottomLeft: Radius.circular(
                              48.0,
                            ),
                          ),
                          color: Colors.black87),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    color: Colors.black87,
                    child: Text(
                      '$qrNumber',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (qrNumber > 0) {
                          qrNumber--;
                        }
                      });
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(48.0),
                              bottomRight: Radius.circular(48.0)),
                          color: Colors.black87),
                      child: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: Colors.grey.withOpacity(.1),
              ),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  scrollDirection: Axis.vertical,
                  itemCount: qrSerials.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: QrImageView(
                        data: qrSerials[index],
                        version: QrVersions.auto,
                        size: 100,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 48),
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0))),
              onPressed: () {
                generateCode();
                setState(() {
                  print(generateCode());
                  print(qrSerials);
                });
                getQRCode();
                qrNumber = 0;
              },
              child: Text(
                'Generate',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 48),
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0))),
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
