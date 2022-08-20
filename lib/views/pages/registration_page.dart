import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/components/my_field.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';

class RegistrationPage extends StatelessWidget {
  final nameController = TextEditingController();
  final contactNoController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authentication = Get.put(Authentication());
  final formKey = GlobalKey<FormState>();
  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 150, 218, 231),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  const Text("Create a New Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 44, 48))),
                  MyField(
                    controller: nameController,
                    labelText: 'Name',
                    myTextValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    controller: contactNoController,
                    labelText: 'Contact Number',
                    myTextValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
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
                  MyField(
                    controller: usernameController,
                    labelText: 'Username',
                    myTextValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    myTextValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    controller: confirmPasswordController,
                    labelText: 'Confirm Password',
                    obscureText: true,
                    myTextValidator: (value) {
                      return null;
                    },
                  ),
                  MyButton(
                      onTap: () {
                        var isFormValid = formKey.currentState!.validate();
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          if (isFormValid) {
                            var data = {
                              "name": nameController.text,
                              "phone": contactNoController.text,
                              "email": emailController.text,
                              "userName": usernameController.text,
                              "password": passwordController.text
                            };
                            authentication.signup(data);
                          }
                        } else {
                          showMessage(
                              title: "Error",
                              message: "Incorrect Password",
                              isSuccess: false);
                        }
                      },
                      buttonName: "Submit"),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(LoginPage()),
                    child: const Text("Sign in",
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 44, 48),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  onTap() {}
}
