import 'package:flutter/material.dart';
import 'package:template_app_2025/app/config/firebase_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase ${FirebaseConfig.environmentName}'),
        backgroundColor: FirebaseConfig.isDev ? Colors.orange : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_done,
              size: 100,
              color: FirebaseConfig.isDev ? Colors.orange : Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Firebase接続成功！',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: FirebaseConfig.isDev ? Colors.orange : Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: FirebaseConfig.isDev
                    ? Colors.orange.withOpacity(0.1)
                    : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '現在の環境: ${FirebaseConfig.environmentName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: FirebaseConfig.isDev ? Colors.orange : Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'プロジェクトID: ${FirebaseConfig.currentFlavor == 'dev' ? 'my-flutter-app-dev' : 'my-flutter-app-prod'}',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
