import 'dart:async';

import 'package:flutter/material.dart';
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
          const Padding(
            padding: EdgeInsets.only(top: 110, left: 25),
            child: Text(
              'Bienvenido de vuelta',
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
                'Para iniciar sesion escanea un QR o selecciona un trabajador para continuar.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  fontFamily: "rounds-regular",
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Image(
              image: AssetImage('assets/escaneo.png'),
              width: 200,
              height: 200,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: SizedBox(
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 20, right: 20),
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
                        padding: const EdgeInsets.only(left: 2),
                        child: TextField(
                          controller: widget.controller,
                          autofocus: false,
                          readOnly: true,
                          cursorColor: Colors.black45,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: "rounds-regular",
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Buscar trabajador..',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: "rounds-regular",
                              color: Colors.black54,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              SlideAnimation(page: const SearchWorkerPage())
                                  .getRoute(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 25),
                    child: SizedBox(
                      width: 350,
                      height: 25,
                      child: Text(
                        widget.info,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontFamily: "rounds-regular",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
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
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10),
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
                            Icons.qr_code_scanner,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(
                      color: Colors.black26,
                      height: 1,
                      indent: 130,
                      endIndent: 130,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: InkWell(
                        onTap: _validateWorker,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
