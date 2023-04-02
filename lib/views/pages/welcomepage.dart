import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';
import 'package:wheels_on_service/views/pages/registration_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Welcome",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 44, 48))),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/logo.png",
              height: 300,
              width: 300,
            ),
            const Text("Login as",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 44, 48))),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            MyButton(onTap: () => Get.to(LoginPage()), buttonName: "Login"),
            const SizedBox(height: 30),
            MyButton(
                onTap: () => Get.to(RegistrationPage()), buttonName: "Register")
          ],
        ),
      ),
    );
  }
}

  // const Text("Welcome",
            //     style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xffF77931))),
             // const SizedBox(height: 80),
            // Container(
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Container(
            //     decoration: const BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.rectangle,
            //         image: DecorationImage(
            //             image: AssetImage('assets/images/fyplogo.jpg'),
            //             fit: BoxFit.fill)),
            //   ),
            // ),
    
