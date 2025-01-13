import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxString itemVariety = ''.obs;
  RxString foodTaste = ''.obs;
  RxString username = ''.obs;
  RxString itemName = ''.obs;
  RxString prize = ''.obs;
  RxString aboutItem = ''.obs;
  RxString newUsername = ''.obs;
  RxString password = ''.obs;
  RxString createPassword = ''.obs;
  RxString confirmPassword = ''.obs;
  RxBool isChecked = false.obs;
  RxBool isLogInOut = false.obs;
  RxList addList = [].toList().obs;
  RxBool allFieldFilled = false.obs;
  RxBool allFieldNotFilled = true.obs;
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

  bool listCheck() {
    allFieldFilled.value = itemVariety.value.isNotEmpty &&
        foodTaste.value.isNotEmpty &&
        itemName.value.isNotEmpty &&
        prize.value.isNotEmpty &&
        aboutItem.value.isNotEmpty;
    return allFieldFilled.value;
  }

  bool listNotCheck() {
    allFieldNotFilled.value = itemVariety.value.isEmpty ||
        foodTaste.value.isEmpty ||
        itemName.value.isEmpty ||
        prize.value.isEmpty ||
        aboutItem.value.isEmpty;
        return allFieldNotFilled.value;
  }
    String capitalizeEachWord(String text) {
      return text.split(' ').map((word) {
        return word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '';
      }).join(' ');
    }
  // resetField() {
  //   username.value = '';
  //   newUsername.value='';
  //   password.value = '';
  // }
}
