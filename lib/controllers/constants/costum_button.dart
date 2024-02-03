import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String buttonFunctionName;
  final Function() doThis;
  final Color? colour;

  CostumButton({
    required this.buttonFunctionName,
    required this.doThis,
    this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colour == null ? Colors.white : colour,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6.0,
          ),
        ),
        fixedSize: Size(
          double.maxFinite,
          48.0,
        ),
      ),
      onPressed: doThis,
      child: Text(
        buttonFunctionName,
        style: TextStyle(color: colour != null ? Colors.white : Colors.black87),
      ),
    );
  }
}
