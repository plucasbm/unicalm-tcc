import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class CustomHomePageButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;

  const CustomHomePageButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 296,
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              ColorsConstants.primaryColor,
              ColorsConstants.primaryColorAlpha,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsConstants.secondaryColor,
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(text, style: TxtStyle.instance.titleTextStyle),
          ],
        ),
      ),
    );
  }
}
