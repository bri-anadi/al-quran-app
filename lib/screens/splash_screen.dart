import 'package:al_quran_app/components/cbutton.dart';
import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:al_quran_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              const CText(
                desc,
                color: kNeutralColor,
                fontSize: kTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kVeryLong),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height / 1.8,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(kShort * 2),
                    ),
                    child: SvgPicture.asset('./assets/images/splash.svg'),
                  ),
                  Positioned(
                    bottom: -kShort,
                    child: CButton(
                      text: readNow,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
