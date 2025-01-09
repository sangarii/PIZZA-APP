import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/common/colors.dart';
import 'package:pizza_app/controller/login_controller.dart';
import 'package:pizza_app/screen/home.dart';

import '../common/textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    loginController.username.value;
    loginController.password.value;
    loginController.newUsername.value;
    loginController.createPassword.value;
    loginController.confirmPassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'asset/pizzatable.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(color: AppColor.colorWhite),
                          // color: Colors.black.withOpacity(0.5)
                          gradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                          ])),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          loginController.isLogInOut == false
                              ? const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: AppColor.colorWhite,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: AppColor.colorWhite,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                          const SizedBox(height: 16), // Space between elements
                          loginController.isLogInOut == false
                              ? CommonTextField(
                                  controller: loginController.controller1,
                                  onChanged: (value) {
                                    loginController.username.value =
                                        value ?? '';
                                    return null;
                                  },
                                  icon: const Icon(Icons.person),
                                  hintText: "Username",
                                )
                              : CommonTextField(
                                  controller: loginController.controller3,
                                  onChanged: (value) {
                                    loginController.newUsername.value =
                                        value ?? '';
                                    return null;
                                  },
                                  icon: const Icon(Icons.person),
                                  hintText: "Username",
                                ),
                          const SizedBox(height: 16), // Space between elements
                          // Space between elements

                          // Password Field
                          loginController.isLogInOut == false
                              ? CommonTextField(
                                  controller: loginController.controller2,
                                  onChanged: (value) {
                                    loginController.password.value =
                                        value ?? "";

                                    return null;
                                  },
                                  icon: const Icon(Icons.lock),
                                  hintText: "Password",
                                )
                              : CommonTextField(
                                  controller: loginController.controller4,
                                  onChanged: (value) {
                                    loginController.createPassword.value =
                                        value ?? "";

                                    return null;
                                  },
                                  icon: const Icon(Icons.lock),
                                  hintText: "Create Password",
                                ),
                          const SizedBox(height: 16),
                          // Password Field
                          loginController.isLogInOut == true
                              ? CommonTextField(
                                  controller: loginController.controller5,
                                  onChanged: (value) {
                                    loginController.confirmPassword.value =
                                        value ?? "";

                                    return null;
                                  },
                                  icon: const Icon(Icons.lock),
                                  hintText: "Confirm Password",
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 16), // Space between elements
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: loginController
                                              .username.value.isEmpty ||
                                          loginController.password.value.isEmpty
                                      ? Colors.deepOrange.withOpacity(0.7)
                                      : Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    loginController.isSignIn();

                                    // Check if fields are empty before proceeding
                                    if (loginController
                                            .username.value.isEmpty ||
                                        loginController
                                            .password.value.isEmpty) {
                                      Get.snackbar(
                                        "Error",
                                        "Please fill in all the fields!",
                                        snackPosition: SnackPosition.TOP,
                                        colorText: AppColor.colorWhite,
                                        backgroundColor: AppColor.colorBlack
                                            .withOpacity(0.7),
                                      );
                                      return; // Exit the function if fields are empty
                                    }


                                    // Validate username and password match
                                    if (loginController.newUsername.value !=
                                            loginController.username.value ||
                                        loginController.createPassword.value !=
                                            loginController.password.value) {
                                      Get.snackbar(
                                        "Error",
                                        (loginController.newUsername.value !=
                                                loginController.username.value)
                                            ? "Username is wrong!"
                                            : "Password is wrong!",
                                        snackPosition: SnackPosition.TOP,
                                        colorText: AppColor.colorWhite,
                                        backgroundColor: AppColor.colorBlack
                                            .withOpacity(0.3)
                                            .withOpacity(0.7),
                                      );
                                      return; // Exit if username or password is incorrect
                                    }

                                    // Navigate to HomeScreen after successful login
                                    Get.to(const HomeScreen());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Text(
                                      "SIGN IN",
                                      style: TextStyle(
                                        color: loginController
                                                    .username.value.isEmpty ||
                                                loginController
                                                    .password.value.isEmpty
                                            ? Colors.white.withOpacity(0.7)
                                            : AppColor.colorWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ((loginController
                                              .newUsername.value.isEmpty) ||
                                          (loginController
                                              .createPassword.value.isEmpty) ||
                                          (loginController
                                              .confirmPassword.value.isEmpty))
                                      ? Colors.green.withOpacity(0.7)
                                      : Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    loginController.isSignUp();

                                    // Check if any field is empty
                                    if (loginController
                                            .newUsername.value.isEmpty ||
                                        loginController
                                            .createPassword.value.isEmpty ||
                                        loginController
                                            .confirmPassword.value.isEmpty) {
                                      Get.snackbar(
                                        "Error",
                                        "Please fill in all the fields!",
                                        snackPosition: SnackPosition.TOP,
                                        colorText: AppColor.colorWhite,
                                        backgroundColor: AppColor.colorBlack
                                            .withOpacity(0.7),
                                      );
                                      return; // Exit if fields are empty
                                    }

                                    // Check if passwords do not match
                                    if (loginController.createPassword.value !=
                                        loginController.confirmPassword.value) {
                                      Get.snackbar(
                                        "Error",
                                        "Passwords do not match!",
                                        snackPosition: SnackPosition.TOP,
                                        colorText: AppColor.colorWhite,
                                        backgroundColor: AppColor.colorBlack
                                            .withOpacity(0.7),
                                      );
                                      return; // Exit if passwords don't match
                                    }

                                    // All validations passed
                                    Get.to(() => const HomeScreen());
                                    loginController.credential(
                                      loginController.newUsername.value
                                          .toUpperCase(),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: ((loginController.newUsername
                                                    .value.isEmpty) ||
                                                (loginController.createPassword
                                                    .value.isEmpty) ||
                                                (loginController.confirmPassword
                                                    .value.isEmpty))
                                            ? Colors.white.withOpacity(0.7)
                                            : AppColor.colorWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
