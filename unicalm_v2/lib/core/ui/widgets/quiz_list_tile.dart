import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicalm_v2/core/models/assessment_model.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class QuizListTile extends StatelessWidget {
  final AssessmentModel assessment;

  const QuizListTile({
    Key? key,
    required this.assessment,
  }) : super(key: key);

  Widget defineColor() {
    int score = assessment.score;

    if (score < 17) {
      return const CircleAvatar(
        backgroundColor: Colors.green,
        radius: 16,
      );
    } else if (score >= 17 && score < 25) {
      return const CircleAvatar(
        backgroundColor: Colors.yellow,
        radius: 16,
      );
    } else {
      return const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String formato = "dd/MM/yy HH:mm";
    DateFormat formatter = DateFormat(formato);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorsConstants.primaryColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Row(
        children: [
          defineColor(),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nível: ${assessment.level}',
                style: TxtStyle.instance.textRegular24,
              ),
              Text(
                'Resultado: ${assessment.score} pontos',
                style: TxtStyle.instance.textRegular16,
              ),
              Text(
                'Realizado em: ${formatter.format(assessment.realizedAt)}',
                style: TxtStyle.instance.textRegular16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
