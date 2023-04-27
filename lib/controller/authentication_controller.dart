import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wheels_on_service/controller/details_controller.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/pages/loader.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';

class Authentication extends GetxController {
  final authService = AuthService();
  final details = CustomerController();

  login(data) async {
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      // Converting json response into Map (list with key and its value)
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        //when success is true save token in ROM
        await authService.saveToken(jsonResponse["token"]);
        //var token = jsonResponse["token"];
        //print(token);
        //details.getDetails(token);
        Get.offAll(const Loader());
        // showMessage(
        //     title: "Success",
        //     message: jsonResponse["message"],
        //     isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  signup(data) async {
    var url = Uri.parse(SIGNUP_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      if (jsonResponse["success"]) {
        Get.offAll(LoginPage());
        // showMessage(
        //     title: "Success",
        //     message: jsonResponse["message"],
        //     isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  logout() async {
    var url = Uri.parse(LOGOUT_API);
    var token_ = await authService.getToken();
    var response = await http.post(url, body: {"token": token_});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        await authService.removeToken();
        Get.offAll(const Loader());
        // showMessage(
        //     title: "Success",
        //     message: jsonResponse["message"],
        //     isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
