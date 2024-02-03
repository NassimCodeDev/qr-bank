import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:qr_bank/controllers/constants/costum_button.dart';
import 'package:qr_bank/controllers/screens/sign_in_screen.dart';
import 'package:qr_bank/controllers/widgets/costum_text_field_style_shape.dart';
import 'package:qr_bank/data/model/users_informations.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  late final String imageLink;

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      return;
    }

    try {
      final fileName = path.basename(_image!.path);
      final storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      await storageRef.putFile(_image!);
      imageLink = await storageRef.getDownloadURL();
    } catch (error) {
      print('Error Uploading image: $error');
    }
  }

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
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      height: 120,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: _image != null
                                ? FileImage(_image!)
                                : AssetImage('assets/images/white.jpeg')
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover),
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 1,
                            color: Colors.grey.withOpacity(.6)),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: _image != null
                          ? null
                          : Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CostumTextFieldStyleShape(
                    controller: fullNameController,
                    hintText: 'full name',
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 12.0,
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
                    height: 24.0,
                  ),
                  CostumButton(
                    buttonFunctionName: 'Create Your Account',
                    doThis: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailAddressController.text,
                                password: passwordController.text);
                        _uploadImage().whenComplete(() {
                          _uploadImage();
                          final usersInfo = UsersInformations(
                              fullName: fullNameController.text,
                              emailAddress: emailAddressController.text,
                              password: passwordController.text,
                              profileImage: imageLink);
                          createUsersAccount(usersInfo);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Done!')));
                        });
                        Timer(
                          Duration(seconds: 2),
                          () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          ),
                        );
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('The Password Provided is Too Weak.')));
                        } else if (error.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('This is Account is Already')));
                        }
                      } catch (error) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Error')));
                      }
                    },
                    colour: Colors.black87,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CostumButton(
                    buttonFunctionName: 'Sign in',
                    doThis: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    colour: Colors.blueAccent,
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

Future<void> createUsersAccount(UsersInformations usersInfos) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc();
  usersInfos.id = docUsers.id;
  final json = usersInfos.toJson();
  await docUsers.set(json);
}
