import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/home_page.dart';

class ServicesPage extends StatelessWidget {
  final Services service;
  const ServicesPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
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
      body: Column(
        children: [
          Column(
            children: [
              Image.network("$baseUrl/${service.image}", height: 200),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text(service.name,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold))),
                          Align(
                            alignment: Alignment.center,
                            child: Text("Rs ${service.price}",
                                style: const TextStyle(
                                    fontSize: 26,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(service.description,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 143, 137, 137))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
