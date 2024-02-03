import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_bank/controllers/constants/costum_button.dart';
import 'package:qr_bank/controllers/constants/costum_text_style.dart';
import 'package:qr_bank/controllers/screens/forgot_password_screen.dart';
import 'package:qr_bank/controllers/screens/home_screen.dart';
import 'package:qr_bank/controllers/screens/sign_up_screen.dart';
import 'package:qr_bank/controllers/widgets/costum_text_field_style_shape.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailAddressController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back,',
                      style: kTitleTextOnboardingStyle.copyWith(
                          color: Colors.black87),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Discover Limitless Choices and Unmatched Convenience.',
                      style: kTitleTextOnboardingStyle.copyWith(
                          color: Colors.black87,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CostumTextFieldStyleShape(
                    controller: emailAddressController,
                    hintText: 'email address',
                    icon: Icons.email_rounded,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CostumTextFieldStyleShape(
                    controller: passwordController,
                    hintText: 'password ***',
                    icon: Icons.lock_rounded,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: false,
                              onChanged: (value) {
                                value = true;
                              }),
                          Text(
                            'Remember Me',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () async {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailAddressController.text,
                                    password: passwordController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot Your Password',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.blueAccent),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CostumButton(
                    buttonFunctionName: 'Sign In',
                    doThis: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailAddressController.text,
                          password: passwordController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    colour: Colors.black87,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CostumButton(
                    buttonFunctionName: 'Create Account',
                    doThis: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    colour: Colors.blueAccent,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Function() doThis;
  final String icon;

  SocialButton({required this.doThis, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: doThis,
      child: Container(
        height: 64.0,
        width: 64.0,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            84.0,
          ),
          border: Border.all(
            width: 1.0,
            color: Colors.grey.withOpacity(
              .4,
            ),
          ),
        ),
        child: Image.asset(
          'assets/icons/$icon',
        ),
      ),
    );
  }
}
