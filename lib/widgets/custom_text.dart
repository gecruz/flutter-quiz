import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration decoration;

  const CustomText(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
  });

  const CustomText.small(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
