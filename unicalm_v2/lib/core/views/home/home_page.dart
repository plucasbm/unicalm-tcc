import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unicalm_v2/core/controllers/firebase_controller.dart';
import 'package:unicalm_v2/core/views/login/login_page.dart';
import 'package:unicalm_v2/core/views/meditation_list/meditation_list_page.dart';
import 'package:unicalm_v2/core/views/mindfulness/mindfulness_list_page.dart';
import 'package:unicalm_v2/core/views/quiz/dialog_quiz_page.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:unicalm_v2/core/ui/widgets/custom_home_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UniCalm',
          style: TxtStyle.instance.titleTextStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title:
                        const Text("Sair do App", textAlign: TextAlign.center),
                    content: const Text("Deseja realmente sair?",
                        textAlign: TextAlign.center),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancelar",
                          style: TxtStyle.instance.textRegular16,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut().then(
                                (user) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                ),
                              );
                        },
                        child: Text(
                          "Sair",
                          style: TxtStyle.instance.textRegular16
                              .copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 120, right: 15),
        child: FutureBuilder(
          future: FirebaseController().getUser(),
          builder: (context, snp) {
            final userData = snp.data;

            if (userData != null && userData.isNotEmpty) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 126,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsConstants.secondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Seja bem-vindo(a),',
                              textAlign: TextAlign.center,
                              style: TxtStyle.instance.textRegular.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '${userData['name']}',
                              textAlign: TextAlign.center,
                              style: TxtStyle.instance.textRegular.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  CustomHomePageButton(
                    icon: Icons.self_improvement,
                    text: 'Para Acalmar',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MeditationListPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomHomePageButton(
                    icon: Icons.psychology,
                    text: 'Mais Foco',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MindfulnessListPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomHomePageButton(
                    icon: Icons.assignment_sharp,
                    text: 'Medir Ansiedade',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DialogQuizPage(),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: ColorsConstants.secondaryColor,
                  size: 64,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
