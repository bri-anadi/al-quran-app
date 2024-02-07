import 'package:al_quran_app/core/apis/ayah_api.dart';
import 'package:al_quran_app/components/capp_bar.dart';
import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/models/ayah.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:al_quran_app/screens/ayah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.nomorSurah});
  final int nomorSurah;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data>(
      future: fetchAyah(number: nomorSurah),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(color: kBackgroundColorLight);
        }
        Data surah = snapshot.data!;
        final player = AudioPlayer();

        return Scaffold(
          appBar: CAppBar(context: context, title: surah.namaLatin),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(kNormal),
                  child: Container(
                    height: kVeryShort * kNormal,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kNormal),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [kTernaryColor, kSecondaryColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.4),
                          blurRadius: kVeryLong,
                          offset: const Offset(0, kNormal),
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
                            vertical: kLong,
                            horizontal: kVeryLong,
                          ),
                          child: Column(
                            children: [
                              CText(
                                surah.namaLatin,
                                fontSize: kDisplay,
                                fontWeight: kMedium,
                                color: kWhiteColor,
                              ),
                              const SizedBox(height: kTiny),
                              CText(
                                surah.arti,
                                color: kWhiteColor,
                                fontSize: kTitle,
                              ),
                              const Divider(
                                color: kSlateColor,
                                thickness: 0.4,
                                height: kVeryLong,
                              ),
                              CText(
                                '${surah.tempatTurun} • ${surah.jumlahAyat} ayat'
                                    .toUpperCase(),
                                fontWeight: kMedium,
                                color: kWhiteColor,
                              ),
                              const Spacer(),
                              SvgPicture.asset('./assets/images/bismillah.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kNormal),
              child: ListView.separated(
                itemCount: surah.jumlahAyat + (nomorSurah == 1 ? -1 : 0),
                separatorBuilder: (_, __) {
                  return const Divider(color: kSlateColor);
                },
                itemBuilder: (context, index) => AyahScreen(
                  ayah: surah,
                  index: index,
                  nomorSurah: nomorSurah,
                  player: player,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
