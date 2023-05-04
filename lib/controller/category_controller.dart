import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wheels_on_service/model/category_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';

class CategoryController extends GetxController {
  var loading = false.obs;
  //getting the category details by creating model
  var categories = <Category>[].obs;

  @override
  // onInit method is runned first in this class
  void onInit() {
    super.onInit();
    get();
  }

  final AuthService authService = AuthService();

  //GET categories from database
  get() async {
    try {
      var url = Uri.parse(GET_CATEGORIES_API);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        if (jsonResponse != null) {
          if (jsonResponse["success"]) {
            categories.value = (jsonResponse["data"] as List)
                .map((e) => Category.fromJson(e))
                .toList();
          } else {
            showMessage(
                title: "Error",
                message: jsonResponse["message"],
                isSuccess: false);
          }
        } else {
          throw Exception("JSON response is null");
        }
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      // Handle the exception here
      print("Error: $e");
      showMessage(
          title: "Error", message: "Failed to load data: $e", isSuccess: false);
    }
  }
}
