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
  bool _userSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Text(
                'Inciar Sesion',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "rounds-bold",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 1, left: 25),
              child: SizedBox(
                width: 300,
                height: 60,
                child: Text(
                  'Utiliza un QR o selecciona un trabajador para continuar,',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontFamily: "rounds-regular",
                  ),
                ),
              ),
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/escaneo.png'),
                width: 200,
                height: 200,
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
                    cursorColor: Colors.black45,
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
                    onTap: () => {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Checkbox(
                      value: _userSave,
                      onChanged: (value) {
                        setState(() {
                          _userSave = !_userSave;
                        });
                      },
                      activeColor: Colors.black38,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Recordar trabajador',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "rounds-regular",
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black38,
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
                      child: const Icon(
                        Icons.qr_code,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Divider(
                color: Colors.black26,
                height: 1,
                indent: 130,
                endIndent: 130,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
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
                  child: const Center(
                    child: Text(
                      'Continuar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'rounds-bold',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

*/
