import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mueblescan/screens/qrview_page.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mueblescan/widgets/wave_clipper.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 25),
            child: Text(
              'Haz tu inventario..',
              style: TextStyle(
                fontSize: 22,
                fontFamily: "rounds-bold",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 1, left: 25),
            child: Text(
              'Holaa! Bienvenido de nuevo',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontFamily: "rounds-regular",
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Image(
                image: AssetImage('assets/escaneo.png'),
                width: 200,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(-5, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Buscar trabajador..',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: "rounds-regular",
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(-5, 10),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.qr_code, size: 30),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 5),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(-5, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*

*/