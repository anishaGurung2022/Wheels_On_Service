import 'package:flutter/material.dart';
import 'package:wheels_on_service/utils/constants.dart';

class ServiceCenterPage extends StatelessWidget {
  const ServiceCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Centers"),
        backgroundColor: primaryColor,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 60),
            // child: InkWell(
            //   onTap: () => Get.to(() => CartPage()),
            //   child: Badge(
            //     badgeContent: Obx(() => SizedBox(
            //         child: Text(cartController.cart.length.toString()))),
            //     child: const Icon(Icons.shopping_cart),
            //   ),
            // ),
          ),
        ],
      ),
      // body: Obx(() => Wrap(
      //       children: productController.products.value
      //           .map((Product product) => ProductComponent(product: product))
      //           .toList(),
      //     )),
    );
  }
}
