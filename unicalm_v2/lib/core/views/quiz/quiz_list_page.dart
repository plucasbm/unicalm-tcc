import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/models/assessment_model.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:unicalm_v2/core/ui/widgets/quiz_list_tile.dart';

class QuizListPage extends StatefulWidget {
  final List<AssessmentModel> assessments;

  const QuizListPage({
    Key? key,
    required this.assessments,
  }) : super(key: key);

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  @override
  Widget build(BuildContext context) {
    final allAssessments = widget.assessments;
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico de Avaliações',
          style: TxtStyle.instance.titleTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: allAssessments.length,
        itemBuilder: (context, index) {
          return QuizListTile(assessment: allAssessments[index]);
        },
      ),
    );
  }
}
