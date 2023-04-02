// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:wheels_on_service/controller/cart_controller.dart';
// import 'package:wheels_on_service/utils/api.dart';
// import 'package:wheels_on_service/utils/constants.dart';
// import 'package:wheels_on_service/views/components/add_to_cart_bottomsheet.dart';
// import 'package:wheels_on_service/views/components/my_button.dart';
// import 'package:wheels_on_service/views/pages/payment/khalti.dart';

// class CartPage extends StatelessWidget {
//   final CartController cartController = Get.find<CartController>();
//   CartPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart"),
//         backgroundColor: primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Obx(() => Column(
//                     children: cartController.cart.values
//                         .map((product) => cartDetail(product))
//                         .toList(),
//                   )),
//             ),
//             Container(
//                 child: Obx(() => MyButton(
//                     onTap: () => const KhaltiExampleApp(),
//                     buttonName: "Checkout ${cartController.total}"))),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget cartDetail(product) {
//     return Slidable(
//         endActionPane: ActionPane(
//           motion: const ScrollMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//                 Get.bottomSheet(AddToCartBottomSheet(product: product));
//               },
//               backgroundColor: const Color(0xFF7BC043),
//               foregroundColor: Colors.white,
//               icon: Icons.edit,
//               label: 'Edit',
//             ),
//             SlidableAction(
//               onPressed: (context) {
//                 cartController.remove(product);
//               },
//               backgroundColor: const Color(0xFF0392CF),
//               foregroundColor: Colors.white,
//               icon: Icons.delete,
//               label: 'Delete',
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Image.network("$baseUrl/${product.image}", height: 100),
//             Text(product.description),
//             Text(product.quantity.toString()),
//           ],
//         ));
//   }
// }
