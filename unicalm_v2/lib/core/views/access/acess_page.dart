import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unicalm_v2/core/services/router_service.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  final loading = ValueNotifier<bool>(false);

  bool toggleLoading() => loading.value = !loading.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
        child: Column(
          children: [
            Image.asset(ImageConstants.fullLogo),
            const SizedBox(height: 60),
            ElevatedButton(
              style: BtnStyle.instance.elevatedButtonStyle,
              onPressed: () {
                toggleLoading();
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RouterServicePage(),
                      ),
                    );
                  },
                );
              },
              child: AnimatedBuilder(
                animation: loading,
                builder: (context, _) {
                  return loading.value
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: ColorsConstants.secondaryColor, size: 32)
                      : Text(
                          'ACESSAR',
                          style: TxtStyle.instance.buttonTextStyle,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
