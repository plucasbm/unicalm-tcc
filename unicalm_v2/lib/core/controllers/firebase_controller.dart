import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unicalm_v2/core/models/assessment_model.dart';

class FirebaseController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future addAssessment(AssessmentModel assessment) async {
    final uid = _auth.currentUser?.uid;

    final docAssessments =
        await FirebaseFirestore.instance.collection('avaliacoes').doc();
    assessment.userId = uid;
    assessment.id = docAssessments.id;

    await docAssessments.set(assessment.toJson());
  }

  Future<Map<String, dynamic>> getUser() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      DocumentSnapshot userDocument = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .get();

      if (userDocument.exists){
        return userDocument.data() as Map<String,dynamic>;
      } else {
        return {};
      }
    }

    return {};
  }


}
