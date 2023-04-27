import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/form/edit_profile_form.dart';
import 'package:wheels_on_service/model/customer_model.dart';
import 'package:wheels_on_service/utils/api.dart';
import 'package:wheels_on_service/views/components/my_button.dart';

class ProfileComponent extends StatelessWidget {
  final Customer customer;
  final authentication = Get.find<Authentication>();
  ProfileComponent({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
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
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300.0),
                      color: Colors.grey[180],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Image.network(
                        "$baseUrl/${customer.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 60,
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
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                      child: Text("Username:  ${customer.userName}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: 190,
                    child: MyButton(
                      buttonName: 'Edit Profile',
                      onTap: () => Get.to(EditProfileForm(
                        customer: customer,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: MyButton(
                      buttonName: 'Logout',
                      onTap: () => logout(),
                    ),
                  )
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
