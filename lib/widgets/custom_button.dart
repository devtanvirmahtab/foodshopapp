import 'package:flutter/material.dart';

import '../utils/themes.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomButton({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Ink(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.amber
          ),
          child: Center(child: Text(title,style: buttonTextStyle,)),
        ),
      ),
    );
  }
}
