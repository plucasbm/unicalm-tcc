import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unicalm_v2/core/models/assessment_model.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/views/quiz/quiz_list_page.dart';

class AssessmentService extends StatefulWidget {
  const AssessmentService({Key? key}) : super(key: key);

  @override
  State<AssessmentService> createState() => _AssessmentServiceState();
}

class _AssessmentServiceState extends State<AssessmentService> {
  @override
  Widget build(BuildContext context) {
    List<AssessmentModel> allAssessments = [];
    final _auth = FirebaseAuth.instance;
    final _uid = _auth.currentUser!.uid;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('avaliacoes')
            .where('userId', isEqualTo: _uid)
            .snapshots(),
        builder: (context, snp) {
          if (snp.hasError) {
            return const Center(
              child: Text('Erro'),
            );
          }

          if (snp.hasData) {
            allAssessments = snp.data!.docs
                .map((doc) => AssessmentModel.fromJson(
                    doc.data() as Map<String, dynamic>))
                .toList();
            return QuizListPage(
              assessments: allAssessments,
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: ColorsConstants.secondaryColor,
                size: 32,
              ),
            );
          }
        },
      ),
    );
  }
}
