import 'package:flutter/material.dart';

// ignore: camel_case_types
class textInput extends StatelessWidget {

  final TextEditingController textEditingController;
  // to make sure that the passwords are hidden
  final bool isPass;
  // 
  final String hintText;
  final TextInputType textInputType;
  const textInput({Key? key, required this.textEditingController,
   required this.isPass, 
   required this.textInputType, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: ,
      decoration: InputDecoration(
        hintText: ,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding:  const EdgeInsets.all(8),
      ),
    );
  }
}