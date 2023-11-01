import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/theme/theme_config.dart';
import 'package:unicalm_v2/core/views/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      home: const SplashPage(),
    );
  }
}