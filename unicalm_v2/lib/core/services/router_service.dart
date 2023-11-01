import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/views/dialog_screen/dialog_screen.dart';
import 'package:unicalm_v2/core/views/home_page_view/home_page_view.dart';

class RouterServicePage extends StatelessWidget {
  const RouterServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const HomePageView();
        } else {
          return const DialogPageViewOne();
        }
      },
    );
  }
}
