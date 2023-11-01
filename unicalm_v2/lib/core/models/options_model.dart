import 'package:unicalm_v2/core/models/question_model.dart';

class OptionsModel {
  final String text;
  final int score;

  OptionsModel({
    required this.text,
    required this.score,
  });
}

final questions = [
  QuestionModel(
    text: 'Seu nível de humor ansioso',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Com que frequência você sente medo?',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Com que frequência você tem insônia?',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Nível de problemas intelectuais (falta de concentração, esquecimento, etc. )',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de humor deprimido',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de cansaço/dores musculares',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de tensão',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Eu sinto alterações no meus sistema nervoso sensorial (tato, temperatura, etc.)',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de sintomas cardiovasculares',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de sintomas respiratórios',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de sintomas gastrointestinais (náusea, azia, etc.)',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de sintomas geniturinários (idas frequentes ao banheiro, etc.)',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),

  QuestionModel(
    text: 'Seu nível de sintomas autonômicos (perda momentânea e repentina de consciência)',
    options: [
      OptionsModel(
        text: '0 (Ausente)',
        score: 0,
      ),
      OptionsModel(
        text: '1 (Leve)',
        score: 1,
      ),
      OptionsModel(
        text: '2 (Moderado)',
        score: 2,
      ),
      OptionsModel(
        text: '3 (Alto)',
        score: 3,
      ),
      OptionsModel(
        text: '4 (Muito Alto)',
        score: 4,
      ),
    ],
  ),
];
