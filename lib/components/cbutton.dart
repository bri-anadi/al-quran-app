import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: kTernaryColor,
          padding: const EdgeInsets.symmetric(horizontal: kLong, vertical: kShort)),
      child: CText(
        text,
        fontSize: kTitle,
        fontWeight: kSemiBold,
        color: kWhiteColor,
      ),
    );
  }
}
