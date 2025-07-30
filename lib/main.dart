import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:template_app_2025/app.dart';
import 'package:template_app_2025/app/config/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);
  } catch (e) {}
  runApp(const App());
}
