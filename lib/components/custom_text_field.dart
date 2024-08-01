import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final bool hasError;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.errorText,
    this.obscureText = false,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: hasError ? Colors.red : const Color(0xffE1ECFC),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.5,
                fontFamily: 'Manrope',
                color: Color(0xff55555A),
              ),
            ),
            TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                filled: false,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  letterSpacing: 0.15,
                  color: Color(0xffA3A2AF),
                ),
                errorText: errorText,
                errorStyle: const TextStyle(
                  color: Color(0xffEA3636),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
