import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mueblescan/models/user.dart';
import 'package:mueblescan/screens/login/login_page.dart';
import 'package:mueblescan/widgets/slide_animation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchWorkerPage extends StatefulWidget {
  const SearchWorkerPage({Key? key}) : super(key: key);

  @override
  _SearchWorkerPageState createState() => _SearchWorkerPageState();
}

class _SearchWorkerPageState extends State<SearchWorkerPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late Future<List<User>> workersData;

  @override
  void initState() {
    super.initState();
    workersData = loadWorkersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
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
                          fontFamily: "inter-regular",
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar trabajador..',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: "inter-regular",
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            workersData = loadWorkersData();
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
              'Disponibles',
              style: TextStyle(
                fontSize: 24,
                fontFamily: "inter-semibold",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: FutureBuilder(
              future: workersData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      User user = snapshot.data![index];
                      String workerName = formatName(user.name, false);

                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            var loginPage = LoginPage();
                            loginPage.controller.text = workerName;
                            loginPage.userId = user.userId;

                            Navigator.of(context).push(
                                SlideAnimation(page: loginPage).getRoute());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: const Border(
                                bottom:
                                    BorderSide(color: Colors.black12, width: 1),
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
                                    formatName(user.name, true),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black45,
                                      fontFamily: "inter-regular",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            color: Colors.black45,
                            size: 60,
                          ),
                          Text(
                            "Ha ocurrido un error\nPor favor recargue de nuevo.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black54,
                              fontFamily: "inter-regular",
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: Colors.black26,
                          strokeWidth: 8,
                          backgroundColor: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String formatName(String name, bool format) {
    List<String> split = name.split(" ");
    String formattedName = "";

    for (int i = 0; i < split.length; i++) {
      if (split[i].isNotEmpty) {
        formattedName +=
            "${split[i][0].toUpperCase()}${split[i].substring(1).toLowerCase()} ";
      }
    }
    if (format && formattedName.length >= 30) {
      formattedName = "${formattedName.substring(0, 30)} ...";
    }
    return formattedName;
  }

  Future<List<User>> loadWorkersData() async {
    var url = _controller.text.isEmpty
        ? Uri.parse('http://127.0.0.1:8000/api/users')
        : Uri.parse(
            'http://127.0.0.1:8000/api/users/search/${_controller.text}');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((user) => User.fromJson(user)).toList();
      }
    } catch (e) {
      print('Error: $e');
    }
    throw Exception('Error en la solicitud');
  }
}
