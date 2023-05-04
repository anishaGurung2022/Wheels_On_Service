import 'dart:convert';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';

class CartController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  var quantity = 1.obs;
  var cart = {}.obs;
  var totalCosting = 0.0.obs;
  final storage = LocalStorage('cart');

  void add({required Services services}) {
    if (cart.containsKey(services.id)) {
      // Service already in cart, handle accordingly (e.g. show error message)
      showMessage(
          title: "Cart",
          message: "This service is already in cart.",
          isSuccess: false);
    } else {
      cart[services.id] = jsonEncode(Services(
          id: services.id,
          name: services.name,
          description: services.description,
          price: services.price,
          serviceCenter: services.serviceCenter,
          category: services.category,
          image: services.image,
          quantity: quantity.value));
      quantity.value = 1;
      totalCosting.value = getTotal();
      Get.back();
      showMessage(
          message: "${services.name} added to bookings", title: 'Success');
    }
  }

  getTotal() {
    var total = 0.0;
    for (var services in cart.values) {
      Services p = Services.fromJson(jsonDecode(services));
      var lineTotal = double.parse(p.price!) * (p.quantity!);
      total = total + lineTotal;
    }
    return total;
  }
}
