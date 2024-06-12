import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mueblescan/screens/login/login_qr_page.dart';
import 'package:mueblescan/screens/search_worker/search_worker_page.dart';

import 'package:mueblescan/widgets/slide_animation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final TextEditingController controller = TextEditingController();
  String info = '';
  String userId = '';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _userSave = false;

  @override
  void initState() {
    formatEntryName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Vamos a\nIniciar sesión',
              style: TextStyle(
                fontSize: 35,
                height: 1.2,
                color: Colors.black,
                fontFamily: "inter-semibold",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: Text(
              'Bienvenido de nuevo! utiliza un \ntrabajador o un QR para continuar.',
              style: TextStyle(
                fontSize: 18,
                height: 2,
                color: Colors.black45,
                fontFamily: "inter-regular",
              ),
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 1),
                child: TextField(
                  controller: widget.controller,
                  autofocus: false,
                  readOnly: true,
                  cursorColor: Colors.black45,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "inter-regular",
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Buscar trabajador..',
                    hintStyle: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter-regular",
                      color: Colors.black54,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      SlideAnimation(page: const SearchWorkerPage()).getRoute(),
                    );
                  },
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, right: 90),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    height: 50,
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'O',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "inter-regular",
                      color: Colors.black38,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: _navigateWorkerQR,
                    child: Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFF868686),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/modo-retrato.png"),
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Trabajador",
                              style: TextStyle(
                                fontFamily: 'inter-regular',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                    onTap: _navigateStartScan,
                    child: Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBAB9B9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Escanear",
                              style: TextStyle(
                                fontFamily: 'inter-regular',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Text(
              widget.info,
              style: const TextStyle(
                color: Colors.black45,
                fontFamily: "inter-regular",
                fontSize: 17,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 70),
            child: InkWell(
              onTap: _validateWorker,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 4,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      fontFamily: 'inter-regular',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigateWorkerQR() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginQRPage()));
  }

  void _navigateStartScan() {
    print("to scan page");
  }

  void _validateWorker() async {
    // Validate if the text field is empty and show a message.
    if (widget.controller.text.isEmpty) {
      infoMessage("Ingrese un trabajador o escanea un QR", 5);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/login"),
        body: {
          "user_id": widget.userId,
        },
      );

      if (response.statusCode != 200) {
        infoMessage("Trabajador no encontrado", 5);
        return;
      }

      final responseData = json.decode(response.body);
    } catch (e) {
      infoMessage("Algo salio mal, intentalo de nuevo..", 7);
    }
  }

  void formatEntryName() {
    String name = widget.controller.text;

    if (name.isEmpty) return;
    if (name.length >= 30) {
      name = "${name.substring(0, 27)} ...";
    }
    widget.controller.text = name;
  }

  void infoMessage(String message, int duration) {
    setState(() {
      widget.info = message;
    });
    Timer(Duration(seconds: duration), () {
      setState(() {
        widget.info = "";
      });
    });
  }
}
