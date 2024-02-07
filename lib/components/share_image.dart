import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareImage extends StatelessWidget {
  final String namaSurah;
  final String artiSurah;
  final String artiAyah;
  final String tempatTurun;
  final String ayah;
  final int nomorAyah;

  const ShareImage({
    super.key,
    required this.namaSurah,
    required this.artiSurah,
    required this.artiAyah,
    required this.ayah,
    required this.nomorAyah,
    required this.tempatTurun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColorLight,
      padding: const EdgeInsets.symmetric(
        horizontal: kNormal,
        vertical: kVeryLong,
      ),
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxHeight: double.infinity),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kNormal),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kTernaryColor, kSecondaryColor],
          ),
          boxShadow: const [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: kVeryLong,
              offset: Offset(0, kNormal),
            )
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: -kLong,
              right: -kVeryLong,
              child: Opacity(
                opacity: 0.08,
                child: SvgPicture.asset(
                  './assets/images/quran.svg',
                  width: 340,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: kNormal,
                horizontal: kLong,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CText(
                    namaSurah,
                    fontSize: kHeading,
                    fontWeight: kMedium,
                    color: kWhiteColor,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: kTiny),
                  CText(
                    '$artiSurah • $tempatTurun',
                    color: kWhiteColor,
                    fontSize: kSubtitle,
                    fontFamily: 'Poppins',
                  ),
                  const Divider(
                    color: kSlateColor,
                    thickness: 0.4,
                    height: kVeryLong,
                  ),
                  CText(
                    ayah,
                    fontSize: kDisplay,
                    color: kWhiteColor,
                    fontFamily: 'Quran Majeed',
                    textAlign: TextAlign.center,
                    height: 1.4,
                  ),
                  const SizedBox(height: kVeryShort),
                  CText(
                    artiAyah,
                    color: kWhiteColor,
                    fontSize: kVeryShort,
                    fontFamily: 'Poppins',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kLong),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    height: kLong - kTiny,
                    width: kLong - kTiny,
                    child: CText(
                      nomorAyah.toString(),
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
