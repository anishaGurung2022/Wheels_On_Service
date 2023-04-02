// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wheels_on_service/controller/cart_controller.dart';
// import 'package:wheels_on_service/model/service_model.dart';
// import 'package:wheels_on_service/utils/api.dart';
// import 'package:wheels_on_service/utils/constants.dart';
// import 'package:wheels_on_service/views/components/add_to_cart_bottomsheet.dart';
// import 'package:wheels_on_service/views/components/my_button.dart';

// class ProductPage extends StatelessWidget {
//   final CartController cartController = Get.find<CartController>();
//   final Product product;
//   ProductPage({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(product.name.toString()),
//           backgroundColor: primaryColor,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Image.network("$baseUrl/${product.image}", height: 200),
//               const SizedBox(height: 30),
//               Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     product.name.toUpperCase(),
//                     style: const TextStyle(
//                         fontSize: 26, fontWeight: FontWeight.w900),
//                   )),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text("Price:  Rs ${product.price}",
//                     style: const TextStyle(fontSize: 26, color: Colors.red)),
//               ),
//               Align(
//                   alignment: Alignment.center,
//                   child: Text(product.description)),
//               const SizedBox(height: 30),
//               // MyButton(
//               //     onTap: () {
//               //       Get.bottomSheet(AddToCartBottomSheet(product: product));
//               //     },
//               //     buttonName: "Add To Cart")
//             ],
//           ),
//         ));
//   }
// }
