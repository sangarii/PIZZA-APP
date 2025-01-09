import 'package:flutter/material.dart';
import 'package:pizza_app/common/colors.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8),itemCount: 4,
      itemBuilder: (BuildContext context, int index) { return  Container(
          decoration: BoxDecoration(
              color: AppColor.colorWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColor.colorBlack.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0, 3),
                    spreadRadius: 5)
              ]
              ));
         },
    );
  }
}