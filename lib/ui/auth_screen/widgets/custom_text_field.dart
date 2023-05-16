import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  bool obscure;
  String validateText;
  final String title,hintText;
  CustomTextField( {Key? key,  this.obscure = false, required this.controller, required this.title, required this.hintText, required this.validateText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: titleStyle,) ,
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            border:   const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder:  OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius:  BorderRadius.circular(10)
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius:  BorderRadius.circular(10)
            ),
            hintText: hintText
            ),
          validator: (value){
            if(value == null || value.isEmpty){
              return validateText;
            }
            return null;
          },
        ),
      ],
    );
  }
}
