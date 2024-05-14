import 'package:flutter/material.dart';
import 'package:mueblescan/screens/qrview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QRViewExample(),
              ),
            );
          },
          child: Text('Escanear Código QR'),
        ),
      ),
    );
  }
}
