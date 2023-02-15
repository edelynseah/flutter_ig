import 'package:flutter/material.dart';

// ignore: camel_case_types
class textInput extends StatelessWidget {

  final TextEditingController textEditingController;
  // to check if its a password or not, to protect and make it hidden
  final bool isPass;
  // signifiers
  final String hintText;
  final TextInputType textInputType;
  const textInput({Key? key, required this.textEditingController,
  this.isPass = false, 
   required this.textInputType, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding:  const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass
    );
  }
}