import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/models/surah.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:al_quran_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.surah});
  final List<Surah> surah;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _surahItem(
        context: context,
        surah: surah[index],
      ),
      separatorBuilder: (_, __) => const Divider(color: kSlateColor),
      itemCount: surah.length,
    );
  }

  GestureDetector _surahItem({
    required BuildContext context,
    required Surah surah,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(nomorSurah: surah.nomor),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: kVeryShort),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('./assets/images/badge.svg'),
                  CText(
                    surah.nomor.toString(),
                    fontWeight: kMedium,
                    fontSize: kSubtitle,
                    color: kSecondaryColor,
                  ),
                ],
              ),
              const SizedBox(width: kShort),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(surah.namaLatin,
                        fontWeight: kMedium, fontSize: kBody),
                    const SizedBox(height: kTiny),
                    CText(
                      '${surah.tempatTurun} • ${surah.jumlahAyat} Ayat'
                          .toUpperCase(),
                      fontWeight: kMedium,
                      fontSize: kSubtitle,
                      color: kNeutralColor,
                    ),
                  ],
                ),
              ),
              CText(
                surah.nama,
                fontFamily: 'Quran Majeed',
                fontSize: kHeading,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      );
}
