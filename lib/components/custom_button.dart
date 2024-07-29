import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xff0461E5),
    this.width = 310,
    this.height = 50,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.textStyle = const TextStyle(
      fontFamily: 'Manrope',
      color: Colors.white,
      fontSize: 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
