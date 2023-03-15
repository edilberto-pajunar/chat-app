import 'package:flutter/material.dart';

import '../config/global_variables.dart';

class ReusableButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color shadowColor;
  final Color boxColor;
  final Color textColor;
  ReusableButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.shadowColor,
    required this.boxColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
