import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/views/login/login_page.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class DialogThreePage extends StatelessWidget {
  const DialogThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 120),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.dialog3,
              width: 416,
              height: 192,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Agora é só fazer o seu login e utilizar todas as ferramentas disponíveis! Bom uso!',
              style: TxtStyle.instance.textRegular24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 120,
            ),
            OutlinedButton(
              style: BtnStyle.instance.outlinedButtonStyle,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Text(
                'AVANÇAR',
                style: TxtStyle.instance.buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
