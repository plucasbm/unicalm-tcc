import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/models/question_model.dart';
import 'package:unicalm_v2/core/models/user_model.dart';
import 'package:unicalm_v2/core/views/quiz/quiz_result_page.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/models/options_model.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:unicalm_v2/core/ui/widgets/options_widget.dart';

class QuizPage extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late var user = _auth.currentUser;

  QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  UserModel convertUser(User ffUser) {
    String? name = ffUser.displayName;
    String? email = ffUser.email;
    String? userImg = ffUser.photoURL;

    return UserModel(
      name: name ?? '',
      userImg: userImg,
      email: email ?? '',
      university: '',
    );
  }

  Column buildQuestion(QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          question.text,
          style: TxtStyle.instance.textRegular16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.isLocked;
                if (question.isLocked) {
                  _score = _score + option.score;
                }
              }
            },
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _isLocked
            ? OutlinedButton(
                style: BtnStyle.instance.outlinedButtonStyle,
                onPressed: () {
                  if (_questionNumber < questions.length) {
                    _controller.nextPage(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeIn,
                    );

                    setState(() {
                      _questionNumber++;
                      _isLocked = false;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizResultPage(
                          score: _score,
                          user: convertUser(widget.user!),
                        ),
                      ),
                    );
                    setState(() {
                      _isLocked = false;
                    });
                  }
                },
                child: Text(
                  _questionNumber < questions.length ? 'Próxima' : 'Resultado',
                  style: TxtStyle.instance.buttonTextStyle,
                ),
              )
            : const SizedBox.shrink(),
            const SizedBox(
              height: 32,
            ),
            const Text('Fonte: https://amenteemaravilhosa.com.br/escala-de-ansiedade-de-hamilton/'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'Questão $_questionNumber/${questions.length}',
              style: TxtStyle.instance.titleTextStyle,
            ),
            const Divider(
              thickness: 2,
              color: ColorsConstants.secondaryColor,
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (_, idx) {
                  final _question = questions[idx];
                  return buildQuestion(_question);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
