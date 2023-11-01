import 'package:unicalm_v2/core/models/options_model.dart';

class QuestionModel {
  final String text;
  final List<OptionsModel> options;
  bool isLocked;
  OptionsModel? selectedOption;

  QuestionModel({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}
