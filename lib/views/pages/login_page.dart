import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authentication_controller.dart';
import '../../utils/shared_prefs.dart';
import '../components/my_button.dart';
import '../components/my_field.dart';
import 'registration_page.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.put(Authentication());
  final AuthService authService = AuthService();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 150, 218, 231),
      body: SingleChildScrollView(
        child: SafeArea(
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
                    )),
                const SizedBox(height: 20),
                const Text("Sign In",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 26, 44, 48))),
                const SizedBox(height: 20),
                MyField(
                  controller: emailController,
                  labelText: 'Email',
                  myTextValidator: (value) {
                    if (!value.toString().contains("@")) {
                      return "Email is not valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                MyField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  myTextValidator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                    onTap: () {
                      var isFormValid = formKey.currentState!.validate();
                      if (isFormValid) {
                        var data = {
                          "email": emailController.text,
                          "password": passwordController.text
                        };
                        authentication.login(data);
                      }
                    },
                    buttonName: "Login"),
                const SizedBox(height: 20),
                const Text("Don't have an account?",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 26, 44, 48))),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(RegistrationPage());
                  },
                  child: const Text("Register Account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 44, 48),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
