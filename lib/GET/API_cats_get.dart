// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Api_cats extends StatefulWidget {
  const Api_cats({super.key});

  @override
  State<Api_cats> createState() => _Api_catsState();
}

class _Api_catsState extends State<Api_cats> {
  //

  List cats = [];

  Future GET_data_cats() async {
    String url = "https://api.thecatapi.com/v1/images/search";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        cats = responsebody;
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    GET_data_cats();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 159, 169),
        centerTitle: true,
        title: const Text(
          "API",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                const Center(
                  child: Text(
                    "Homeless cats  ᓚᘏᗢ",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: 200,
                  child: Image.network(cats[i]['url']), // عرض الصورة
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
