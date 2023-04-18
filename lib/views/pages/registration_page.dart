import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/components/my_field.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';

class RegistrationPage extends StatelessWidget {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final contactNoController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authentication = Get.find<Authentication>();
  final formKey = GlobalKey<FormState>();
  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  const Text("Create a New Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 12, 12))),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 70,
                      child: MyField(
                        controller: nameController,
                        labelText: 'Fullname',
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: addressController,
                        labelText: 'Address',
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: contactNoController,
                        labelText: 'Contact Number',
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: emailController,
                        labelText: 'Email',
                        hintText: 'xyz@gmail.com',
                        myTextValidator: (value) {
                          if (!value.toString().contains("@gmail.com")) {
                            return "Email is not valid";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: usernameController,
                        labelText: 'Username',
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: passwordController,
                        labelText: 'Password',
                        obscureText: true,
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 0, right: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: MyField(
                        controller: confirmPasswordController,
                        labelText: 'Confirm Password',
                        obscureText: true,
                        myTextValidator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: MyButton(
                        onTap: () {
                          var isFormValid = formKey.currentState!.validate();
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            if (isFormValid) {
                              var data = {
                                "name": nameController.text,
                                "phone": contactNoController.text,
                                "address": addressController.text,
                                "email": emailController.text,
                                "userName": usernameController.text,
                                "password": passwordController.text
                              };
                              authentication.signup(data);
                              print(data);
                            }
                          } else {
                            showMessage(
                                title: "Error",
                                message: "Incorrect Password",
                                isSuccess: false);
                          }
                        },
                        buttonName: "Submit"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(LoginPage()),
                        child: const Text("Sign In",
                            style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  onTap() {}
}
