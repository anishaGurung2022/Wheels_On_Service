// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wheels_on_service/controller/cart_controller.dart';
// import 'package:wheels_on_service/model/service_model.dart';
// import 'package:wheels_on_service/views/components/my_button.dart';

// class AddToCartBottomSheet extends StatelessWidget {
//   final Product product;
//   final CartController cartController = Get.find<CartController>();
//   AddToCartBottomSheet({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       height: 500,
//       child: Column(
//         children: [
//           const Center(child: Text("Add To Cart")),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     if (cartController.quantity.value > 1) {
//                       cartController.quantity.value--;
//                     }
//                   },
//                   child: const Text("-")),
//               Center(
//                   child: Obx(
//                       () => Text(cartController.quantity.value.toString()))),
//               ElevatedButton(
//                   onPressed: () {
//                     cartController.quantity.value++;
//                   },
//                   child: const Text("+")),
//             ],
//           ),
//           //adds a product in cart
//           MyButton(
//               onTap: () {
//                 cartController.add(product);
//               },
//               buttonName: "Add To Cart")
//         ],
//       ),
//     );
//   }
// }
