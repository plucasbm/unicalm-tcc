import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class DialogOnePage extends StatelessWidget {
  const DialogOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 120),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.dialog1,
              width: 416,
              height: 192,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Olá! Seja muito bem-vindo ao UniCalm, o seu aplicativo de auxílio no controle da ansiedade!',
              style: TxtStyle.instance.textRegular24,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
