import 'dart:convert';

import 'package:get/get.dart';
import 'package:wheels_on_service/model/customer_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

class CustomerController extends GetxController {
  //var loading = false.obs;
  final AuthService authService = AuthService();
  var details = <Customer>[].obs;

  @override
  void onInit() async {
    super.onInit();
    var token_ = await authService.getToken();
    getDetails(token_);
  }

  getDetails(token_) async {
    if (token_ != null) {
      var url = Uri.parse(GET_DETAILS);
      //var token_ = await authService.getToken();
      var response = await http.post(url, body: {"token": token_});
      try {
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          if (jsonResponse["success"]) {
            details.value = (jsonResponse["data"] as List)
                .map((e) => Customer.fromJson(e))
                .toList();
            showMessage(title: "Success", message: jsonResponse["message"]);
          } else {
            showMessage(
                title: "Error",
                message: jsonResponse["message"],
                isSuccess: false);
          }
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      } catch (e) {
        if (e is FormatException) {
          // Handle the FormatException here
          print('Caught a FormatException: $e');
        } else {
          // Handle other types of exceptions here
          print('Caught an exception: $e');
        }
      }
    } else {
      print("Error loading details");
    }
  }
}
