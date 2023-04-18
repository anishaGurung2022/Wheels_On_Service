import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/utils/constants.dart';
import '../../controller/authentication_controller.dart';
import '../../utils/shared_prefs.dart';
import '../components/my_button.dart';
import '../components/my_field.dart';
import 'registration_page.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // final authentication = Get.put(Authentication());
  final authentication = Get.find<Authentication>();
  final AuthService authService = AuthService();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                    height: 170,
                    width: 270,
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
                    )),
                //const SizedBox(height: 20),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 30,
                          color: Color(0xffffffff),
                          height: 2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Welcome Back!',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff121212),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                // const Text("Sign In",
                //     style: TextStyle(
                //         fontSize: 25,
                //         fontWeight: FontWeight.bold,
                //         color: textColor)),
                //const SizedBox(height: 20),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 25, bottom: 0, right: 20, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign In to your account',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 149, 149),
                        fontWeight: FontWeight.w400,
                        height: 2.8,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    height: 70,
                    child: MyField(
                      controller: emailController,
                      labelText: 'Email',
                      myTextValidator: (value) {
                        if (!value.toString().contains("@")) {
                          return "Email is not valid";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    height: 70,
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
                const Padding(
                  padding:
                      EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: Color(0xfff77931),
                        fontWeight: FontWeight.w700,
                        height: 3.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: MyButton(
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
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(fontSize: 15, color: textColor)),
                    InkWell(
                      onTap: () {
                        Get.to(RegistrationPage());
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
