import 'package:al_quran_app/core/apis/surah_api.dart';
import 'package:al_quran_app/components/capp_bar.dart';
import 'package:al_quran_app/components/greeting.dart';
import 'package:al_quran_app/core/models/surah.dart';
import 'package:al_quran_app/screens/surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: fetchSurah(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: kBackgroundColorLight,
            appBar: CAppBar(
              iconPrefix: SvgPicture.asset('./assets/images/logo.svg'),
              onPressedPrefix: () {},
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                right: kNormal,
                left: kNormal,
                top: kLong,
              ),
              child: NestedScrollView(
                headerSliverBuilder: (_, __) => const [
                  SliverToBoxAdapter(
                    child: Gretting(),
                  ),
                ],
                body: SurahScreen(surah: snapshot.data!),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
