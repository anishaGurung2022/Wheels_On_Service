import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Function? myTextValidator;
  const MyField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.obscureText = false,
      this.myTextValidator,
      this.hintText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          // return null;
          if (value!.isEmpty) {
            return "$labelText is required";
          }
          if (myTextValidator != null) {
            return myTextValidator!(value);
          }
          return null;
        },
      ),
    );
  }
}
