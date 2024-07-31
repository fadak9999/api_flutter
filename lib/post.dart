// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unnecessary_const
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class post_api extends StatefulWidget {
  const post_api({super.key});

  @override
  State<post_api> createState() => _post_apiState();
}

class _post_apiState extends State<post_api> {
  //
  List posts = [];

  Future add_data_post() async {
    String url = "https://jsonplaceholder.typicode.com/posts"; // رابط البوست

    var response = await http.post(Uri.parse(url), body: {
      "userId": "3",
      "title": "fadak",
      "body": "i am ay shy",
    });

    if (response.statusCode == 201) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        posts.add(responsebody);
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              add_data_post();
            },
            child: const Text("ADD POST"),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
