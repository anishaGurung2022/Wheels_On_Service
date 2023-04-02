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
    var url = Uri.parse(GET_CATEGORIES_API);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        categories.value = (jsonResponse["data"] as List)
            .map((e) => Category.fromJson(e))
            .toList();

        // var responseData = jsonResponse['data'];
        // for (var i = 0; i < responseData.length; i++) {
        //   categories.add(Category.fromJson(responseData[i]));
        // }
        Get.back();
        showMessage(title: "Success", message: jsonResponse["message"]);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    }
  }
}
