import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/views/quiz/quiz.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class DialogQuizPage extends StatefulWidget {
  const DialogQuizPage({super.key});

  @override
  State<DialogQuizPage> createState() => _DialogQuizPageState();
}

class _DialogQuizPageState extends State<DialogQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.quizDialog,
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Serão feitas algumas perguntas sobre o que e como você tem se sentido nos últimos dias (incluindo o momento em que você está respondendo)',
              style: TxtStyle.instance.textRegular16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'A resposta varia de 0 (ausência total) à 4 (presença efetiva). Lembre-se se ser sincero em suas respostas.',
              style: TxtStyle.instance.textRegular16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Ah! E vale lembrar que essa avaliação não é um diagnóstico. A ajuda de um profissional é sempre muito importante.',
              style: TxtStyle.instance.textRegular16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 96,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(),
                  ),
                );
              },
              style: BtnStyle.instance.outlinedButtonStyle,
              child: Text(
                'RESPONDER',
                style: TxtStyle.instance.buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
