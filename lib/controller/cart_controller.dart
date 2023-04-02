// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:wheels_on_service/model/service_model.dart';
// import 'package:wheels_on_service/utils/constants.dart';

// class CartController extends GetxController {
//   var cart = {}.obs;
//   var quantity = 0.obs;
//   var total = 0.0.obs;
//   final storage = LocalStorage('cart');

//   @override
//   //storing cart data in local storage
//   void onInit() {
//     super.onInit();
//     storage.ready.then((value) {
//       if (storage.getItem('cart') != null) {
//         var cartMap = jsonDecode(storage.getItem('cart'));
//         cart.clear();
//         cartMap.forEach((key, value) {
//           cart[key] = Product.fromJson(value);
//         });
//       }
//     });
//   }

//   // add product in cart
//   add(Product product) {
//     product.quantity = quantity.value;
//     cart[product.id] = product;
//     Get.back();
//     showMessage(
//         title: 'Success', message: "${product.description} added to cart");
//     //showMessage(message: "${product.description} added to cart");
//     storage.setItem("cart", jsonEncode(cart));
//     getTotal();
//   }

//   // removes added product
//   remove(Product product) {
//     cart.remove(product.id);
//     storage.setItem("cart", jsonEncode(cart));
//     getTotal();
//   }

//   // clears added cart
//   clearCart() {
//     cart.value = {};
//     storage.setItem("cart", jsonEncode(cart));
//     getTotal();
//     update();
//   }

//   //calculates total of added cart
//   getTotal() {
//     var tempTotal = 0.0;
//     cart.forEach((key, value) {
//       tempTotal += double.parse(value.price.toString()) *
//           int.parse(value.quantity.toString());
//     });
//     total.value = tempTotal;
//   }
// }
