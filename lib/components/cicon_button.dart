import 'package:al_quran_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CIconButton extends StatefulWidget {
  final IconData defaultIcon;
  final IconData changedIcon;
  final VoidCallback onTap;

  const CIconButton({
    super.key,
    required this.changedIcon,
    required this.defaultIcon,
    required this.onTap,
  });

  @override
  State<CIconButton> createState() => _CIconButtonState();
}

class _CIconButtonState extends State<CIconButton> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          state = !state;
        });
        widget.onTap();
      },
      child: Icon(
        state ? widget.changedIcon : widget.defaultIcon,
        color: kSecondaryColor,
      ),
    );
  }
}
