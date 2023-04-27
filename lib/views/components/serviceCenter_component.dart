import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/model/service_center_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/views/components/serviceCenter_details_page.dart';

class ServiceCenterComponent extends StatelessWidget {
  final ServiceCenter serviceCenter;
  const ServiceCenterComponent({super.key, required this.serviceCenter});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.width / 2,
        width: Get.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () =>
                Get.to(ServiceCenterPage(serviceCenter: serviceCenter)),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                        child:
                            Image.network("$baseUrl/${serviceCenter.image}")),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      serviceCenter.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
