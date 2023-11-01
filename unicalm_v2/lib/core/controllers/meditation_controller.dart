
import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/models/meditation_model.dart';
import 'package:unicalm_v2/core/repositories/meditation_repository/meditation_repository.dart';

class MeditationController {
  final MeditationRepository _meditation_repository;

  MeditationController(this._meditation_repository);

  ValueNotifier<List<MeditationModel>> meditations =  ValueNotifier<List<MeditationModel>>([]);

  fetchMedit() async {
    meditations.value = await _meditation_repository.getMeditation('assets/data/meditation_data.json');
  }

  fetchMind() async {
    meditations.value = await _meditation_repository.getMeditation('assets/data/mindfulness_data.json');
  }

  
}