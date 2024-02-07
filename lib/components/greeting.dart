import 'dart:math';

import 'package:al_quran_app/core/enums/quotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import 'package:al_quran_app/core/utils/constant.dart';

class Gretting extends StatelessWidget {
  const Gretting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kShort),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kTernaryColor, kSecondaryColor],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -kNormal,
            right: -kShort,
            child: Container(
              alignment: Alignment.bottomRight,
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 3,
              child: SvgPicture.asset('./assets/images/quran.svg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kNormal),
            height: kNormal * 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(HeroiconsSolid.sparkles, color: kWhiteColor),
                const SizedBox(height: kVeryShort),
                Text(
                  quotes[Random().nextInt(quotes.length)],
                  maxLines: 4,
                  style: const TextStyle(
                    color: kWhiteColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
