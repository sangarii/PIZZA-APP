import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/common/colors.dart';
import 'package:pizza_app/controller/login_controller.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.colorWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColor.colorBlack.withOpacity(0.2),
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                    spreadRadius: 5)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.5), // Shadow color with opacity
                        spreadRadius: 2, // How much the shadow spreads
                        blurRadius: 5, // How blurred the shadow is
                        offset: const Offset(
                          0,
                          4,
                        ), // Offset of the shadow (x, y)
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'asset/cheesePizza.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.colorred,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          child: Text(
                            loginController.itemVariety.value.toUpperCase(),
                            style: const TextStyle(
                                color: AppColor.colorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(63, 244, 67, 54)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          child: Text(
                            loginController.foodTaste.value.toUpperCase(),
                            style: const TextStyle(
                                color: AppColor.colorred,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  loginController
                      .capitalizeEachWord(loginController.itemName.value),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  loginController.aboutItem.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "\$${loginController.prize.value}",
                        style: const TextStyle(
                            color: AppColor.colorBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),const Spacer(),
                     Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.colorBlack),
                        child:const Icon(Icons.add,size:30,color:AppColor.colorWhite)
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
