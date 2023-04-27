import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/book_now_bottomsheet.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/bookings.dart';

class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Book"),
        actions: [
          InkWell(
            onTap: () => Get.to(() => BookingPage()),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("My Bookings"),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Wrap(
                children: cartController.cart.values
                    .map((e) => cartTile(
                          service: Services.fromJson(jsonDecode(e)),
                        ))
                    .toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => MyButton(
                  onTap: () {
                    Get.bottomSheet(BookNowBottomSheet());
                  },
                  //width: Get.width,
                  buttonName: "Pay ${cartController.totalCosting}",
                )),
          )
        ],
      ),
    );
  }

  Widget cartTile({required Services service}) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              cartController.remove(service);
              CartController();
            },
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        width: Get.width,
        height: (Get.width / 3),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(color: Colors.black, width: 0.5),
                  boxShadow: const [BoxShadow()],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network("$baseUrl/${service.image}", height: 65),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Service Name:",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                service.name!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                service.price!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
