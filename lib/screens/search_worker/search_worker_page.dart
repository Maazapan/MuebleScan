import 'package:flutter/material.dart';
import 'package:mueblescan/screens/login_page.dart';
import 'package:mueblescan/screens/search_worker/search_worker_item.dart';
import 'package:mueblescan/widgets/slide_animation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchWorkerPage extends StatefulWidget {
  const SearchWorkerPage({Key? key}) : super(key: key);

  @override
  _SearchWorkerPageState createState() => _SearchWorkerPageState();
}

class _SearchWorkerPageState extends State<SearchWorkerPage> {
  SearchWorkerItem workerItem = SearchWorkerItem(search: "");
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFf8f8f8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
                          autofocus: true,
                          controller: _controller,
                          focusNode: _focusNode,
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
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              workerItem.search = _controller.text;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'Trabajadores',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "rounds-bold",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 50,
                width: 300,
                child: Text(
                  'Selecciona un trabajador disponible para continuar y iniciar sesion.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontFamily: "rounds-regular",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 570,
              child: workerItem,
            ),
          ],
        ),
      ),
    );
  }
}
