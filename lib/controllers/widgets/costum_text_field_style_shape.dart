import 'package:flutter/material.dart';

class CostumTextFieldStyleShape extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  CostumTextFieldStyleShape(
      {required this.hintText, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          6.0,
        ),
        color: Colors.grey.withOpacity(
          .1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 10.0,
                color: Colors.grey.withOpacity(.8),
                fontStyle: FontStyle.italic,
              ),
            ),
          )),
          Icon(
            icon,
            size: 18.0,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
