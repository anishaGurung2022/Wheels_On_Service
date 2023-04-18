import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/controller/service_controller.dart';

import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/search_bar.dart';
import 'package:wheels_on_service/views/components/service_component.dart';

class ServicesPage extends StatelessWidget {
  final ServiceController serviceController = Get.put(ServiceController());
  ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Services"),
          backgroundColor: primaryColor,
          // actions: [
          //   Container(
          //     padding: const EdgeInsets.only(right: 60),
          //     child: InkWell(
          //       onTap: () => Get.to(() => CartPage()),
          //       child: Badge(
          //         badgeContent: Obx(() => SizedBox(
          //             child: Text(cartController.cart.length.toString()))),
          //         child: const Icon(Icons.shopping_cart),
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchBarWidget(),
              Obx(() => Wrap(
                    children: serviceController.services.value
                        .map((Services services) =>
                            ServiceComponent(service: services))
                        .toList(),
                  )),
            ],
          ),
        ));
  }
}
