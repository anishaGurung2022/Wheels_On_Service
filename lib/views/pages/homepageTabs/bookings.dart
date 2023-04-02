import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wheels_on_service/utils/constants.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookings"),
        backgroundColor: primaryColor,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 60),
          ),
        ],
      ),
    );
  }
}
