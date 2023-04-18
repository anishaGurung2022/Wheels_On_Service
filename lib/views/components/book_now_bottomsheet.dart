import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/pages/payment/khalti.dart';

class BookNowBottomSheet extends StatefulWidget {
  BookNowBottomSheet({Key? key}) : super(key: key);

  @override
  _BookNowBottomSheetState createState() => _BookNowBottomSheetState();
}

class _BookNowBottomSheetState extends State<BookNowBottomSheet> {
  AuthService authService = AuthService();
  final CartController cartController = Get.find<CartController>();
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  var bookingID = "".obs;

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
                  width: 180,
                  child: MyButton(
                    onTap: () => _selectDate(context),
                    buttonName: "Select Date",
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 180,
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              "Selected Time: ${_selectedTime.format(context)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            MyButton(
                onTap: () {
                  // cartController.placeOrder(token: "token");
                  //placeOrder();
                  //placeOrder();
                  // var data = {
                  //   "total": cartController.totalCosting.toString(),
                  //   "booking_date":
                  //       "${_selectedDate.toLocal().toString().split(' ')[0]} ${_selectedTime.format(context)}",
                  //   "booking_details": jsonEncode(cartController.cart.values
                  //           .map((e) => jsonEncode({
                  //                 "service_id": e["id"],
                  //                 "serviceCenter": e["serviceCenter"]
                  //               }))
                  //           .toList())
                  //       .toString()
                  // };
                  // place(data);
                  showMessage(
                      title: "Success",
                      message: "Services Booked",
                      isSuccess: true);
                  Get.to(KhaltiExampleApp());
                },
                buttonName: "Booknow")
          ],
        ),
      ),
    );
  }

  Future<void> placeOrder() async {
    var token = await authService.getToken();
    var booking_details = cartController.cart.values
        .map((e) => jsonEncode({
              "services_id": jsonDecode(e)["id"],
              "serviceCenter": jsonDecode(e)["serviceCenter"]
            }))
        .toList();
    var data = {
      "token": token.toString(),
      "booking_date":
          "${_selectedDate.toLocal().toString().split(' ')[0]} ${_selectedTime.format(context)}",
      "booking_details": jsonEncode(booking_details),
      "total": cartController.totalCosting.value.toString(),
    };
    print(data);
    //isLoading.value = true;
    var response = await http.post(Uri.parse(ADD_BOOKING_API), body: data);
    if (response.statusCode == 200) {
      // Converting json response into Map (list with key and its value)
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        showMessage(
            title: "Success",
            message: jsonResponse["message"],
            isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
