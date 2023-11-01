import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/controllers/meditation_controller.dart';
import 'package:unicalm_v2/core/repositories/meditation_repository/meditation_repository_impl.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:unicalm_v2/core/views/meditation/meditation_page.dart';

class MeditationListPage extends StatefulWidget {
  const MeditationListPage({super.key});

  @override
  State<MeditationListPage> createState() => _MeditationListPageState();
}

class _MeditationListPageState extends State<MeditationListPage> {
  final MeditationController _meditationController =
      MeditationController(MeditationRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _meditationController.fetchMedit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditações',
          style: TxtStyle.instance.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32),
        child: ValueListenableBuilder(
          valueListenable: _meditationController.meditations,
          builder: (_, list, __) {
            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (_, idx) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MeditationPage(
                          meditation: list[idx],
                        ),
                      ),
                    );
                  },
                  leading: Image.asset(
                    list[idx].imgUrl,
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    list[idx].title,
                    style: TxtStyle.instance.textBold16,
                  ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duração: ${list[idx].duration}",
                            style: TxtStyle.instance.textRegular),
                      ]),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                thickness: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
