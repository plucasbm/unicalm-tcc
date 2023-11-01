import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:unicalm_v2/core/models/meditation_model.dart';
import 'package:unicalm_v2/core/repositories/meditation_repository/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  @override
  Future<List<MeditationModel>> getMeditation(String path) async {
    var value = await rootBundle.loadString(path);
    List meditationData = jsonDecode(value);
    return meditationData
        .map(
          (meditation) => MeditationModel.fromJson(meditation),
        )
  .toList();
  }
}
