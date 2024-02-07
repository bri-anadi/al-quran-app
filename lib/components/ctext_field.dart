import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;

  const CTextField(this.hintText, {super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: kShort.toInt(),
      decoration: InputDecoration(
        filled: true,
        fillColor: kSlateColor,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kNeutralColor,
          fontSize: kTitle,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kNormal,
          vertical: kShort,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: kVeryShort, left: kShort),
          child: Icon(icon, color: kNeutralColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(kShort),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor),
          borderRadius: BorderRadius.circular(kShort),
        ),
        counterText: '',
        counterStyle: const TextStyle(height: double.minPositive),
      ),
    );
  }
}
