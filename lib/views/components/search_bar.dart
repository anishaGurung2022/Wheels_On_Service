import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/search_controller.dart';
import 'package:wheels_on_service/controller/service_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(initState: (state) {
      Get.find<ServiceController>().services();
    }, builder: (_) {
      return GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: ServicesSearch(_.services));
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.grey.withOpacity(.1),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black.withOpacity(.4),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Search Services",
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
