import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/common/colors.dart';
import 'package:pizza_app/controller/login_controller.dart';

import 'items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorgrey.shade100,
        title: Text(
          "WELCOME ${loginController.credential.value}",
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.production_quantity_limits),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_back_ios)
        ],
      ),
      body: const Padding(
        padding:  EdgeInsets.all(15.0),
        child: 
         Items(),
      ),
    );
  }
}
