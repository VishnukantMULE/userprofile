import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final Color bcolor;
  final double bwidth;
  final double bradius;
  final TextInputType ktype;
  final bool obstxt;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.bcolor = Colors.black,
    this.bwidth = 1.0,
    this.bradius = 8.0,
    this.ktype = TextInputType.text,
    this.obstxt = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: ktype,
      obscureText: obstxt,
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(bradius),
          borderSide: BorderSide(width: bwidth, color: bcolor),
        ),
      ),
    );
  }
}
