import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/controller/service_center_controller.dart';
import 'package:wheels_on_service/model/service_center_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/serviceCenter_component.dart';
import 'package:wheels_on_service/views/pages/payment/cart_page.dart';
import 'package:wheels_on_service/views/pages/slideshow.dart';

//HomePage shows Service Centres
class HomePage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  final ServiceCenterController serviceCenterController =
      Get.put(ServiceCenterController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Icon(Icons.notifications),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () => Get.to(() => CartPage()),
              child: Badge(
                badgeContent: Obx(() => SizedBox(
                        child: Text(
                      cartController.cart.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ))),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            MySlideshow(),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Wrap(
                  children: serviceCenterController.serviceCenters.value
                      .map((ServiceCenter serviceCenter) =>
                          ServiceCenterComponent(serviceCenter: serviceCenter))
                      .toList(),
                )),
          ],
        ),
      ),
    );
  }
}
