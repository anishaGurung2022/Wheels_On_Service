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

  @override
  void onInit() {
    super.onInit();
    storage.ready.then((value) {
      if (storage.getItem('cart') != null) {
        var cartMap = jsonDecode(storage.getItem('cart'));
        cart.clear();
        cartMap.forEach((key, value) {
          cart[key] = Services.fromJson(value);
        });
      }
    });
  }

  void add({required Services services}) {
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
    storage.setItem("cart", jsonEncode(cart));
    Get.back();
    showMessage(
        message: "${services.name} added to bookings", title: 'Success');
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

  remove(Services services) {
    cart.remove(services.id);
    storage.setItem("cart", jsonEncode(cart));
    getTotal();
  }

  clearCart() {
    cart.clear();
    storage.setItem("cart", jsonEncode(cart));
    getTotal();
    update();
  }
}
