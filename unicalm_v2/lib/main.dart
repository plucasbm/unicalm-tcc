import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/unicalm_v2.dart';
import 'package:unicalm_v2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}