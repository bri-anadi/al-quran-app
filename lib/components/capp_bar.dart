import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import 'package:al_quran_app/components/ctext.dart';
import 'package:al_quran_app/core/utils/constant.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({
    super.key,
    this.title,
    this.colorPrefix,
    this.iconPrefix,
    this.onPressedPrefix,
    this.context,
  });

  final String? title;
  final Color? colorPrefix;
  final Widget? iconPrefix;
  final VoidCallback? onPressedPrefix;
  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackgroundColorLight,
      surfaceTintColor: kBackgroundColorLight,
      title: Row(
        children: [
          IconButton(
            onPressed: onPressedPrefix ?? () => Navigator.of(context).pop(),
            icon: iconPrefix ?? const Icon(HeroiconsOutline.arrowLeft),
            highlightColor: Colors.transparent,
            color: colorPrefix ?? kPrimaryColor,
          ),
          const SizedBox(width: 12),
          CText(
            title ?? appName,
            fontWeight: kBold,
            fontSize: kHeading,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
