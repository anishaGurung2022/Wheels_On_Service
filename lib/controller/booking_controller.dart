import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/pages/payment/khalti.dart';
import '../utils/constants.dart';

class BookingController extends GetxController {
  final authService = AuthService();
  final CartController cartController = Get.find<CartController>();
  var bookingId = "".obs;

//   // place(data) async {
//   //   var token_ = await authService.getToken();
//   //   data["token"] = token_;
//   //   var url = Uri.parse(ADD_BOOKING_API);
//   //   var response = await http.post(url, body: data);
//   //   if (response.statusCode == 200) {
//   //     var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//   //     if (jsonResponse["success"]) {
//   //       orderId.value = jsonResponse["order_id"].toString();
//   //       cartController.clearCart();
//   //       Get.to(() => const KhaltiExampleApp());
//   //     } else {
//   //       print(jsonResponse);
//   //       showMessage(
//   //           message: jsonResponse["message"], isSuccess: false, title: 'Error');
//   //     }
//   //   } else {
//   //     print('Request failed with status: ${response.statusCode}.');
//   //   }
//   // }

  // Future<void> placeOrder({required String token}) async {
  //     var token = await authService.getToken();
  //     var booking_details =  cartController.cart.values.map((e) =>
  //     jsonEncode({
  //       "service_id": jsonDecode(e)["id"],
  //       //"quantity": jsonDecode(e)["quantity"]
  //     })
  //     ).toList();
  //   var data = {"token": token.toString(),
  //     "booking_details": jsonEncode(booking_detail),
  //     "total": totalCosting.value.toString()
  //    };
  //   isLoading.value = true;
  //   var response = await http.post(Uri.parse(PLACE_ORDER), body: data);
  //   isLoading.value = false;
  //   var decodedResponse = await jsonDecode(response.body);
  //   if (decodedResponse["success"]) {
  //     Get.snackbar("Success", decodedResponse["message"]);
  //   } else {
  //     Get.snackbar("Failed", decodedResponse["message"]);
  //   }
  // }
}
