import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/models/options_model.dart';
import 'package:unicalm_v2/core/models/question_model.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class OptionsWidget extends StatelessWidget {
  final QuestionModel question;
  final ValueChanged<OptionsModel> onClickedOption;

  const OptionsWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });

  Widget buildOption(BuildContext context, OptionsModel option) {
    final color = getColorForOption(option, question);

    return InkWell(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color,
              width: 2,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: TxtStyle.instance.textRegular,
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(OptionsModel option, QuestionModel question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return ColorsConstants.secondaryColor;
      }
    }
    return ColorsConstants.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }
}
