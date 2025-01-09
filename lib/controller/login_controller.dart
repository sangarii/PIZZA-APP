import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxString username = ''.obs;
  RxString newUsername = ''.obs;
  RxString password = ''.obs;
  RxString createPassword = ''.obs;
  RxString confirmPassword = ''.obs;
  RxBool isChecked = false.obs;
  RxBool isLogInOut = false.obs;
  RxList loginCreden = [].toList().obs;
  var credential = ''.obs;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  isSignIn() {
    isLogInOut.value = false;
  }

  isSignUp() {
    isLogInOut.value = true;
  }

  // resetField() {
  //   username.value = '';
  //   newUsername.value='';
  //   password.value = '';
  // }
}
