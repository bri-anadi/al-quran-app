import 'package:al_quran_app/components/cicon_button.dart';
import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/components/share_image.dart';
import 'package:al_quran_app/core/models/ayah.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class AyahScreen extends StatelessWidget {
  const AyahScreen({
    super.key,
    required this.ayah,
    required this.index,
    required this.nomorSurah,
    required this.player,
  });
  final Data ayah;
  final int index;
  final int nomorSurah;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    ScreenshotController controller = ScreenshotController();
    int i = index + (nomorSurah == 1 ? 1 : 0);
    return Screenshot(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kShort),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kTiny),
            Container(
              decoration: BoxDecoration(
                color: kSlateColor,
                borderRadius: BorderRadius.circular(kShort),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: kShort,
                vertical: kVeryShort,
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    height: kLong - kTiny,
                    width: kLong - kTiny,
                    child: CText(
                      ayah.ayat[i].nomorAyat.toString(),
                      color: kWhiteColor,
                    ),
                  ),
                  const Spacer(),
                  CIconButton(
                    changedIcon: HeroiconsOutline.arrowUpOnSquare,
                    defaultIcon: HeroiconsOutline.arrowUpOnSquare,
                    onTap: () async {
                      final image = await controller.captureFromWidget(
                        ShareImage(
                          namaSurah: ayah.namaLatin,
                          artiSurah: ayah.arti,
                          tempatTurun: ayah.tempatTurun,
                          ayah: ayah.ayat[i].teksArab,
                          artiAyah: ayah.ayat[i].teksIndonesia,
                          nomorAyah: ayah.ayat[i].nomorAyat,
                        ),
                      );
                      Share.shareXFiles(
                        [XFile.fromData(image, mimeType: 'image/png')],
                      );
                    },
                  ),
                  const SizedBox(width: kShort),
                  CIconButton(
                    changedIcon: HeroiconsOutline.pause,
                    defaultIcon: HeroiconsOutline.play,
                    onTap: () async {
                      await player
                          .setUrl(ayah.ayat[i].audio.entries.last.value);
                      player.playing ? player.stop() : player.play();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: kLong),
            CText(
              ayah.ayat[i].teksArab,
              fontSize: kDisplay,
              fontFamily: 'Quran Majeed',
              textAlign: TextAlign.right,
              height: 2.2,
            ),
            const SizedBox(height: kNormal),
            CText(
              ayah.ayat[i].teksIndonesia,
              fontSize: kBody,
            ),
          ],
        ),
      ),
    );
  }
}
