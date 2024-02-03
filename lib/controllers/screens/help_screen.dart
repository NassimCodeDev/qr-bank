import 'package:flutter/material.dart';
import 'package:qr_bank/data/model/help_bank.dart';

HelpBank helpBank = HelpBank();

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Help',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.numbers),
              title: Text(
                '${helpBank.getTitle(index)}',
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                '${helpBank.getDescription(index)}',
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            );
          },
          itemCount: helpBank.getLength(),
        ),
      ),
    );
  }
}
