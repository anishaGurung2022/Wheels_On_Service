import 'package:flutter/material.dart';
import 'package:wheels_on_service/utils/constants.dart';

class MyButton extends StatelessWidget {
  final onTap;
  final String buttonName;
  const MyButton({Key? key, required this.onTap, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            width: 600,
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(buttonName,
                    style: const TextStyle(
                        color: backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            )),
      ),
    );
  }
}
