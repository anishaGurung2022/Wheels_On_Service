import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/service_controller.dart';
import 'package:wheels_on_service/model/service_center_model.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/service_component.dart';

//This pages shows the details of services center and services provided by that service center
class ServiceCenterPage extends StatelessWidget {
  final ServiceCenter serviceCenter;
  final ServiceController serviceController = Get.put(ServiceController());

  ServiceCenterPage({Key? key, required this.serviceCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          serviceCenter.name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
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
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network("$baseUrl/${serviceCenter.image}", height: 200),
          const SizedBox(height: 10),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 5,
          //         blurRadius: 7,
          //         offset: const Offset(0, 3), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 700,
                      decoration: const BoxDecoration(
                        color: Color(0xffdedede),
                        // border: Border.all(
                        //     width: 1.0,
                        //     color: Color.fromARGB(255, 198, 196, 196)),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text("Service Center Name",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor))),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      height: 50,
                      width: 700,
                      decoration: const BoxDecoration(
                        color: Color(0xffdedede),
                        // border: Border.all(
                        //     width: 1.0,
                        //     color: Color.fromARGB(255, 198, 196, 196)),
                      ),
                      child: Center(
                        child: Text(serviceCenter.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Address:  ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))),
                        Align(
                          alignment: Alignment.center,
                          child: Text(serviceCenter.address,
                              style: const TextStyle(
                                  fontSize: 20,
                                  //color: Colors.red,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Contact Number:  ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))),
                        Align(
                          alignment: Alignment.center,
                          child: Text(serviceCenter.phone,
                              style: const TextStyle(
                                  fontSize: 20,
                                  //color: Colors.red,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Email: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))),
                        Align(
                          alignment: Alignment.center,
                          child: Text(serviceCenter.email,
                              style: const TextStyle(
                                  fontSize: 20,
                                  //color: Colors.red,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            child: const Align(
              alignment: Alignment.center,
              child: Text("Show Services",
                  style: TextStyle(
                      fontSize: 20,
                      //color: Colors.red,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          //getServiceCenterServices()
          SingleChildScrollView(
            child: Column(
              children: [getServiceCenterServices()],
            ),
          )
        ]),
      ),
    );
  }

  getServiceCenterServices() {
    return Obx((() => Wrap(
          children: serviceController.services.value
              .where((Services services) =>
                  services.serviceCenter == serviceCenter.name)
              .map((service) => ServiceComponent(service: service))
              .toList(),
        )));
  }
}
