import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/controller/city_controller.dart';
import 'package:wheels_on_service/controller/service_center_controller.dart';
import 'package:wheels_on_service/model/city_model.dart';
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
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 10, bottom: 0, right: 10, top: 10),
            //   child: Obx(() => DropdownButtonHideUnderline(
            //           child: DropdownButton2(
            //         isExpanded: true,
            //         hint: Row(
            //           children: const [
            //             Icon(
            //               Icons.list,
            //               size: 16,
            //               color: Colors.black,
            //             ),
            //             SizedBox(
            //               width: 4,
            //             ),
            //             Expanded(
            //               child: Text(
            //                 'Select City',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   color: Colors.black,
            //                 ),
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //           ],
            //         ),
            //         //selected value
            //         value: CitiesController.selectedCity.value,
            //         //fetching data from Cities Controller
            //         items: CitiesController.cities.value
            //             .map((item) => DropdownMenuItem<Cities>(
            //                   value: item,
            //                   child: Text(
            //                     item.name,
            //                     style: const TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.black,
            //                     ),
            //                     overflow: TextOverflow.ellipsis,
            //                   ),
            //                 ))
            //             .toList(),
            //         onChanged: (value) {
            //           CitiesController.selectedCity.value = value as Cities;
            //         },
            //         icon: const Icon(
            //           Icons.arrow_forward_ios_outlined,
            //         ),
            //         iconSize: 14,
            //         iconEnabledColor: Colors.black,
            //         iconDisabledColor: Colors.grey[200],
            //         buttonHeight: 50,
            //         buttonWidth: 370,
            //         buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            //         buttonDecoration: BoxDecoration(
            //           //borderRadius: BorderRadius.circular(14),
            //           border: Border.all(
            //             color: Colors.black26,
            //           ),
            //           color: Colors.grey,
            //         ),
            //         buttonElevation: 2,
            //         itemHeight: 40,
            //         itemPadding: const EdgeInsets.only(left: 14, right: 14),
            //         dropdownMaxHeight: 200,
            //         dropdownWidth: 370,
            //         dropdownPadding: null,
            //         dropdownDecoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(14),
            //           color: Colors.grey[200],
            //         ),
            //         dropdownElevation: 8,
            //         scrollbarRadius: const Radius.circular(40),
            //         scrollbarThickness: 6,
            //         scrollbarAlwaysShow: true,
            //         offset: const Offset(-20, 0),
            //       ))),
            // ),
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
