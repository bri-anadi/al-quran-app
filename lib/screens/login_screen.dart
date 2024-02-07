import 'dart:math';

import 'package:al_quran_app/components/cbutton.dart';
import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/components/ctext_field.dart';
import 'package:al_quran_app/core/enums/quotes.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:al_quran_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kLong),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CText(
                appName,
                color: kBlackColor,
                fontSize: kDisplay,
                fontWeight: kBold,
              ),
              const SizedBox(height: kNormal),
              CText(
                quotes[Random().nextInt(quotes.length)],
                color: kNeutralColor,
                fontSize: kTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kVeryLong),
              const CTextField(
                inputName,
                icon: HeroiconsOutline.user,
              ),
              const SizedBox(height: kNormal),
              Container(
                alignment: Alignment.centerRight,
                child: CButton(
                  text: start,
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
