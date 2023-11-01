import 'package:cloud_firestore/cloud_firestore.dart';

class AssessmentModel {
  String id;
  String? userId;
  final String level;
  final DateTime realizedAt;
  final int score;

  AssessmentModel({
    this.id = '',
    this.userId = '',
    required this.level,
    required this.realizedAt,
    required this.score,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'level': level,
  //     'realizedAt': realizedAt.toUtc(),
  //     'score': score,
  //   };
  // }

  // factory AssessmentModel.fromMap(Map<String, dynamic> map) {
  //   return AssessmentModel(
  //     level: map['level'],
  //     realizedAt: (map['realizedAt'] as Timestamp).toDate(),
  //     score: map['score'],
  //   );
  // }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'userId': userId,
      'level': level,
      'realizedAt': realizedAt,
      'score': score,
    };
  }

  factory AssessmentModel.fromJson(Map<String,dynamic> json){
    return AssessmentModel(
      id: json['id'],
      userId: json['userId'],
      level: json['level'],
      realizedAt: (json['realizedAt'] as Timestamp).toDate(),
      score: json['score'],
    );
  }
}
