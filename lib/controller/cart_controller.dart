import 'dart:convert';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  var quantity = 1.obs;
  var cart = {}.obs;
  var totalCosting = 0.0.obs;
  final storage = LocalStorage('cart');

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
    //storage.setItem("cart", jsonEncode(cart));

    Get.back();
    showMessage(message: "${services.name} added to cart", title: 'Success');
  }

  void increase() {
    quantity.value++;
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

  void remove({required String id}) {
    cart.remove(id);
    totalCosting.value = getTotal();
    update();
    showMessage(message: "Item removed from cart", title: 'Success');
  }

  void decrease() {
    if (quantity.value != 1) {
      quantity.value--;
    }
  }

  // Future<void> placeOrder({required String token}) async {
  //   var token = await authService.getToken();
  //   var booking_details = cart.values
  //       .map((e) => jsonEncode({
  //             "services_id": jsonDecode(e)["id"],
  //             "serviceCenter": jsonDecode(e)["serviceCenter"]
  //           }))
  //       .toList();
  //   var data = {
  //     "token": token.toString(),
  //     "booking_details": jsonEncode(booking_details),
  //     "total": totalCosting.value.toString(),
  //   };
  //   isLoading.value = true;
  //   print(data);
  //   var response = await http.post(Uri.parse(ADD_BOOKING_API), body: data);
  //   isLoading.value = false;

  //   var decodedResponse = await json.decode(response.body);
  //   if (decodedResponse["success"]) {
  //     Get.snackbar("Success", decodedResponse["message"]);
  //   } else {
  //     Get.snackbar("Failed", decodedResponse["message"]);
  //   }
  // }
}
