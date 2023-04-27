import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/booking_controller.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/components/my_button.dart';

class BookNowBottomSheet extends StatefulWidget {
  BookNowBottomSheet({Key? key}) : super(key: key);

  @override
  _BookNowBottomSheetState createState() => _BookNowBottomSheetState();
}

class _BookNowBottomSheetState extends State<BookNowBottomSheet> {
  AuthService authService = AuthService();
  final CartController cartController = Get.find<CartController>();
  final BookingController bookingController = Get.put(BookingController());
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Select Date and Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 170,
                    child: MyButton(
                      onTap: () => _selectDate(context),
                      buttonName: "Select Date",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 170,
                    child: MyButton(
                      onTap: () => _selectTime(context),
                      buttonName: "Select Time",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Selected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                "Selected Time: ${_selectedTime.format(context)}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              MyButton(
                  onTap: () async {
                    var token_ = await authService.getToken();
                    var data = {
                      "token": token_,
                      "total": cartController.totalCosting.value,
                      "booking_date":
                          "${_selectedDate.toLocal().toString().split(' ')[0]} ${_selectedTime.format(context)}",
                      "booking_details": cartController.cart.values
                          .map((e) => {
                                "services_id": jsonDecode(e)["id"],
                                "serviceCenter": jsonDecode(e)["serviceCenter"]
                              })
                          .toList()
                    };
                    bookingController.place(jsonEncode(data));
                    //place(data);
                  },
                  buttonName: "Book now")
            ],
          ),
        ),
      ),
    );
  }
}
