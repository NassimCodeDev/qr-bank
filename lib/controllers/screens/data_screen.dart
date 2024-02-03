import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'QR Data List',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off_rounded),
              title: Text(
                'Number Serial',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              subtitle: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
        onPressed: () {},
        child: Icon(
          Icons.download_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
