import 'package:flutter/material.dart';
import 'package:qr_bank/controllers/constants/costum_button.dart';
import 'package:qr_bank/controllers/widgets/costum_text_field_style_shape.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CostumTextFieldStyleShape(
                controller: emailAddressController,
                hintText: 'email address',
                icon: Icons.email_rounded),
            SizedBox(
              height: 16,
            ),
            CostumTextFieldStyleShape(
                controller: passwordController,
                hintText: 'new password',
                icon: Icons.lock_rounded),
            SizedBox(
              height: 16,
            ),
            CostumTextFieldStyleShape(
                controller: passwordController,
                hintText: 'confirm password',
                icon: Icons.lock_rounded),
            SizedBox(
              height: 16,
            ),
            CostumButton(
                doThis: () {},
                buttonFunctionName: 'Send',
                colour: Colors.black87),
          ],
        ),
      ),
    );
  }
}
