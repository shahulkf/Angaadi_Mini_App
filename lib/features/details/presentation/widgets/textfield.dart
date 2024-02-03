import 'package:angaadi/core/colors/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: kBasecolor,
      decoration:const InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kBasecolor))),
      

    );
  }
}