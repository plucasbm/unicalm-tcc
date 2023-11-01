import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/views/access/acess_page.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>  with TickerProviderStateMixin{
late final _controller = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat(reverse: true);
  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 7),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              const AccessPage(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.asset(
              ImageConstants.fullLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}