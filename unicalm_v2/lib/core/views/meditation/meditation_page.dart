import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/models/meditation_model.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class MeditationPage extends StatefulWidget {
  final MeditationModel meditation;

  const MeditationPage({
    super.key,
    required this.meditation,
  });

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {

  AudioPlayer? player;
  String text = 'INICIAR';

  bool isPlaying = false;

  Future<void> playAudio(String path, bool isPlaying) async {

    if(isPlaying){
      player?.play(AssetSource(path));
      setState(() {
        text = 'PAUSAR';
      });
    } else {
      player?.pause();
      setState(() {
        text = 'INICIAR';
      });
    }
  }

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditação',
          style: TxtStyle.instance.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Antes de iniciar, certifique-se:",
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textBold16,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "- De estar um em local confortável e silencioso",
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textRegular16.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              "- De estar com a coluna reta e pernas cruzadas",
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textRegular16.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              "- De respirar fundo e procure acalmar sua mente",
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textRegular16.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              "- De Sinta a própria respiração",
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textRegular16.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Text(
              widget.meditation.title,
              textAlign: TextAlign.center,
              style: TxtStyle.instance.textBold16,
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: (){
                setState(() {
                  isPlaying = !isPlaying;
                });
                playAudio(widget.meditation.audioUrl, isPlaying);
              },
              child: Text(
                text,
                style: TxtStyle.instance.buttonTextStyle,
              ),
            ),
            const SizedBox(
              height: 272,
            ),
            Text(
              'Fonte: https://www.gov.br/servidor/pt-br/assuntos/contecomigo/paginas/paginas-dos-hyperlinks/bem-estar-e-saude-1/reserve-5-minutos-do-seu-dia-para-meditar',
              style: TxtStyle.instance.textRegular.copyWith(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
