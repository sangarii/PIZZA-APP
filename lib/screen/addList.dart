import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/common/textConstant.dart';
import 'package:pizza_app/controller/login_controller.dart';
import 'package:pizza_app/screen/home.dart';
import 'package:pizza_app/common/itemList.dart';

import '../common/colors.dart';
import '../common/textField.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _addListState();
}

class _addListState extends State<AddList> {
  LoginController loginController = Get.put(LoginController());
  List<ItemsList> itemData = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                // border: Border.all(color: AppColor.colorWhite),
                // color: Colors.black.withOpacity(0.5)
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.grey.withOpacity(0.4),
                ])),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add List",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: AppColor.colorBlack,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    AppConstant.itemname,
                    style: TextStyle(
                        color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CommonTextField(
                    onChanged: (value) {
                      loginController.itemName.value = value ?? '';
                      return null;
                    },
                    hintText: "Item Name",
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    AppConstant.foodTaste,
                    style: TextStyle(
                        color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CommonTextField(
                    onChanged: (value) {
                      loginController.foodTaste.value = value ?? '';
                      return null;
                    },
                    hintText: "Taste of Food",
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    AppConstant.itemVariety,
                    style: TextStyle(
                        color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CommonTextField(
                    onChanged: (value) {
                      loginController.itemVariety.value = value ?? '';
                      return null;
                    },
                    hintText: "Item Variety",
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    AppConstant.prize,
                    style: TextStyle(
                        color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CommonTextField(
                    onChanged: (value) {
                      loginController.prize.value = value ?? '';
                      return null;
                    },
                    hintText: "Prize",
                    keyBoardtype: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    AppConstant.aboutItem,
                    style: TextStyle(
                        color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CommonTextArea(
                    onChanged: (value) {
                      loginController.aboutItem.value = value ?? '';
                      return null;
                    },
                    hintText: "About Item",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: loginController.listCheck()
                          ? AppColor.colorcyan
                          : AppColor.colorcyan.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (loginController.listNotCheck()) {
                          Get.snackbar(
                            "Error",
                            "Fill the all field!",
                            snackPosition: SnackPosition.TOP,
                            colorText: AppColor.colorWhite,
                            backgroundColor:
                                AppColor.colorBlack.withOpacity(0.3),
                          );
                        } else {
                          loginController.listCheck()
                              ? Get.to(const HomeScreen())
                              : null;
                        }
                        ItemsList newItem = ItemsList(
                            varietyItem: loginController.itemVariety.value,
                            tasteFood: loginController.foodTaste.value,
                            itemName: loginController.itemName.value,
                            prize: loginController.prize.value,
                            aboutItem: loginController.aboutItem.value);
                        itemData.add(newItem);
                      },
                      child: Center(
                        child: Text(
                          "ADD ITEM",
                          style: TextStyle(
                            color: loginController.listCheck()
                                ? AppColor.colorWhite
                                : AppColor.colorWhite.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
