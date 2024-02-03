import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Account',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              child: Icon(Icons.camera_alt_rounded),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Khadija Barhou',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8,
            ),
            Text('12/09/2000'),
          ],
        ),
      ),
    );
  }
}
