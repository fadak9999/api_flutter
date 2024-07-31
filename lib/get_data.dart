// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unnecessary_const
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class get_api extends StatefulWidget {
  const get_api({super.key});

  @override
  State<get_api> createState() => _get_apiState();
}

class _get_apiState extends State<get_api> {
  List posts = [];

  Future GET_data_post() async {
    String url = "https://jsonplaceholder.typicode.com/posts"; // رابط البوست
//?id=2
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        posts = responsebody;
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    GET_data_post();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              posts[i]['title'],
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            subtitle: Text(posts[i]['body'],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          );
        },
      ),
    );
  }
}
