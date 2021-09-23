import 'package:flutter/material.dart';
import 'package:mobile/src/cores/cores.dart';

class ButtonComp extends StatelessWidget {
  const ButtonComp({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.width = 90,
    this.height = 50,
    this.font = 16,
    this.fontColor = Colors.white,
    this.gradient,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final Color color;
  final double width;
  final double height;
  final double font;
  final Color fontColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: Responsive.screenWidth(width, context),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              gradient: gradient),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: fontColor,
                fontSize: font,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
