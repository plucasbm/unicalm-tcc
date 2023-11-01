import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class DialogTwoPage extends StatelessWidget {
  const DialogTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 120),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.dialog2,
              width: 416,
              height: 192,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Por aqui nós temos um só objetivo: te ajudar a lidar melhor com a ansiedade e ter uma melhor saúde mental.',
              style: TxtStyle.instance.textRegular24,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}