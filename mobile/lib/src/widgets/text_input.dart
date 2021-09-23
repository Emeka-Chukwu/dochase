import 'package:flutter/material.dart';
import 'package:mobile/src/cores/cores.dart';

class TextInputFieldGeneric extends StatelessWidget {
  const TextInputFieldGeneric({
    Key? key,
    required this.controller,
    required this.title,
    this.maxLlines = 1,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final int maxLlines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (str) => print(controller.text),
      maxLines: maxLlines,
      controller: controller,
      obscureText: obscureText,
      // keyboardType: TextInputType.number,

      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade900,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.blue, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.blue, width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: title,
          hintStyle: const TextStyle(color: AppColor.blue)),
    );
  }
}
