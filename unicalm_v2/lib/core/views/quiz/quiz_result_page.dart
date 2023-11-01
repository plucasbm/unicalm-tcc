import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:unicalm_v2/core/controllers/firebase_controller.dart';
import 'package:unicalm_v2/core/models/assessment_model.dart';
import 'package:unicalm_v2/core/models/user_model.dart';
import 'package:unicalm_v2/core/views/home_page_view/home_page_view.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final UserModel user;

  String level = '';

  QuizResultPage({
    super.key,
    required this.score,
    required this.user,
  });

  Widget calculateScore(int score) {
    if (score < 17) {
      level = 'Leve';
      return Column(
        children: [
          Text(
            'Sua pontuação: $score pontos',
            style: TxtStyle.instance.textRegular24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Você possui um nível leve de ansiedade',
            style: TxtStyle.instance.textRegular24,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (score >= 17 && score < 25) {
      level = 'Moderado';
      return Column(
        children: [
          Text(
            'Sua pontuação: $score pontos',
            style: TxtStyle.instance.textRegular24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Você possui um nível moderado de ansiedade',
            style: TxtStyle.instance.textRegular24,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      level = 'Grave';
      return Column(
        children: [
          Text(
            'Sua pontuação: $score pontos',
            style: TxtStyle.instance.textRegular16,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Você possui um nível grave de ansiedade',
            style: TxtStyle.instance.textRegular24,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 160, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.task_alt_outlined,
                size: 120,
                color: ColorsConstants.secondaryColor,
              ),
              const SizedBox(
                height: 40,
              ),
              calculateScore(score),
              const SizedBox(
                height: 120,
              ),
              OutlinedButton(
                onPressed: () async {
                  final assessment = AssessmentModel(
                    level: level,
                    realizedAt: DateTime.now(),
                    score: score,
                  );

                  await FirebaseController().addAssessment(assessment);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageView(),
                    ),
                  );
                },
                style: BtnStyle.instance.outlinedButtonStyle,
                child: Text(
                  'VOLTAR',
                  style: TxtStyle.instance.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
