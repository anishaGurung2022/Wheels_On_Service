import 'package:flutter/material.dart';

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
              color: const Color.fromARGB(255, 26, 44, 48),
            ),
            width: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(buttonName,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 150, 218, 231),
                      fontSize: 20,
                    )),
              ),
            )),
      ),
    );
  }
}
