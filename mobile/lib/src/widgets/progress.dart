import 'package:flutter/material.dart';
import 'package:mobile/src/cores/cores.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.black.withOpacity(.05),
      ),
      child: SizedBox(
        height: Responsive.screenHeight(100, context),
        width: Responsive.screenWidth(100, context),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
