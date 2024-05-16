import 'dart:html';

import 'package:flutter/material.dart';

class SearchWorkerPage extends StatefulWidget {
  const SearchWorkerPage({Key? key}) : super(key: key);

  @override
  _SearchWorkerPageState createState() => _SearchWorkerPageState();
}

class _SearchWorkerPageState extends State<SearchWorkerPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final workers = [
    'Ana María Gutiérrez',
    'Luis Alberto Rodríguez',
    'María José García',
    'Juan Carlos Martínez',
    'Laura Elena Hernández',
    'Carlos Andrés Pérez',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFf8f8f8),
      ),
      body: Column(
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
                      Icons.arrow_back,
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
            child: ListView.builder(
              itemCount: workers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: const Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(-5, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.person,
                            color: Colors.black54,
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${workers[index]} ${index}",
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black45,
                              fontFamily: "rounds-regular",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
