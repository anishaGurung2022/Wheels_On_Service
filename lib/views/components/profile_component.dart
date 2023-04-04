import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/model/customer_model.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/home_page.dart';

class ProfileComponent extends StatelessWidget {
  final Customer customer;
  final authentication = Get.find<Authentication>();
  ProfileComponent({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //Expanded(child: Image.network("$baseUrl/${service.image}")),
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage('assets/images/user_profile.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color(0xffdedede),
                      border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 169, 169, 169)),
                    ),
                    child: Center(
                      child: Text(
                        customer.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color(0xffdedede),
                      border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 169, 169, 169)),
                    ),
                    child: Center(
                      child: Text("Contact Number:  ${customer.phone}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color(0xffdedede),
                      border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 169, 169, 169)),
                    ),
                    child: Center(
                      child: Text("Email:  ${customer.email}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color(0xffdedede),
                      border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 169, 169, 169)),
                    ),
                    child: Center(
                      child: Text("Address:  ${customer.address}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: MyButton(
                      buttonName: 'Logout',
                      onTap: () => logout(),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  logout() async {
    await authentication.logout();
  }
}
