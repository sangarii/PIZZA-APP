import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/textField.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _addListState();
}

class _addListState extends State<AddList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            // border: Border.all(color: AppColor.colorWhite),
            // color: Colors.black.withOpacity(0.5)
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.6),
              Colors.grey.withOpacity(0.6),
            ])),
        child: Column(
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Add List",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: AppColor.colorBlack,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            CommonTextField(
              onChanged: (value) {
                return null;
              },
              hintText: "Variety of Item",
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
              onChanged: (value) {
                return null;
              },
              hintText: "Taste of Food",
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
              onChanged: (value) {
                return null;
              },
              hintText: "Item name",
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextField(
              onChanged: (value) {
                return null;
              },
              hintText: "Prize",
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextArea(
              onChanged: (value) {
                return null;
              },
              hintText: "About Item",
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {},
                child:const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 137, vertical: 15),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: AppColor.colorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
