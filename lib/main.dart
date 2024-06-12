import 'package:flutter/material.dart';
import 'package:mueblescan/screens/login/login_page.dart';
import 'package:mueblescan/screens/login/login_qr_page.dart';
import 'package:mueblescan/screens/search_worker/search_worker_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuebleScan',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/search_worker': (context) => const LoginQRPage(),
      },
    );
  }
}
