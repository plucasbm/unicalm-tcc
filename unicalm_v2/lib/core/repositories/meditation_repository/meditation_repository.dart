
import 'package:unicalm_v2/core/models/meditation_model.dart';

abstract class MeditationRepository {
  Future<List<MeditationModel>> getMeditation(String path);
}