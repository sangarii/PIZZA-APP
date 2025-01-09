import 'package:flutter/material.dart';

import 'colors.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final Icon? icon;
  final TextEditingController? controller;
  final String? Function(String?)? onChanged;
  const CommonTextField({super.key, this.hintText, this.onChanged,this.icon,this.controller});

  @override
  Widget build(BuildContext context) {
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.colorWhite
            .withOpacity(0.6), // Border color when TextField is not focused
        width: 1.0,
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.colorBlack
            .withOpacity(0.6), // Border color when TextField is focused
        width: 1.0,
      ),
    );
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.all(25),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder),
    );
  }
}

class CommonTextArea extends StatelessWidget {
  final String? hintText;
  final Icon? icon;
  final TextEditingController? controller;
  final String? Function(String?)? onChanged;
  const CommonTextArea({super.key, this.hintText, this.onChanged,this.icon,this.controller});

  @override
  Widget build(BuildContext context) {
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.colorWhite
            .withOpacity(0.6), // Border color when TextField is not focused
        width: 1.0,
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.colorBlack
            .withOpacity(0.6), // Border color when TextField is focused
        width: 1.0,
      ),
    );
    return TextField(
      controller: controller,
      onChanged: onChanged,maxLines: 5,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.all(25),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder),
    );
  }
}