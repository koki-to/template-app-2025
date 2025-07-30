import 'package:flutter/material.dart';
import 'package:template_app_2025/app/config/firebase_config.dart';
import 'package:template_app_2025/features/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase ${FirebaseConfig.currentFlavor.toUpperCase()}',
      theme: ThemeData(
        primarySwatch: FirebaseConfig.isDev ? Colors.orange : Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
