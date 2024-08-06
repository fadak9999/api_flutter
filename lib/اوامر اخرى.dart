// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PPD extends StatefulWidget {
  const PPD({super.key});

  @override
  State<PPD> createState() => _PPDState();
}

class _PPDState extends State<PPD> {
  List<dynamic> posts = [];

// ! add_data

  Future add_data_post() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.post(Uri.parse(url), body: {
      "id": "1",
      "title": 'hussain 12345',
      "body": 'montasar',
      "userId": "1",
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

// ! update_data FOR ALL
  Future update_data_post() async {
    String url =
        "https://jsonplaceholder.typicode.com/posts/1"; //todo رابط التحديث (يجب أن يحتوي على معرف المورد)

    var response = await http.put(Uri.parse(url), body: {
      "id": "1",
      "title": 'hussain',
      "body": 'Fadak',
      "userId": "1",
    });

    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        posts.add(responsebody);
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

// ! patch_data

  Future patch_data_post() async {
    String url =
        "https://jsonplaceholder.typicode.com/posts/1"; //todo رابط التحديث (يجب أن يحتوي على معرف المورد)

    var response = await http.patch(Uri.parse(url), body: {
      "title": 'Hussain & Fadak  ',
    });

    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        posts.add(responsebody);
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

// ! delete_data
  Future delete_data_post() async {
    String url =
        "https://jsonplaceholder.typicode.com/posts/1"; //todo  رابط الحذف (يجب أن يحتوي على معرف المورد)

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        posts.removeWhere((post) => post['id'] == 1);
      });
      print('Deleted');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

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
          ElevatedButton(
            onPressed: () {
              update_data_post();
            },
            child: const Text("UPDATE POST"),
          ),
          ElevatedButton(
            onPressed: () {
              patch_data_post();
            },
            child: const Text("PATCH POST"),
          ),
          ElevatedButton(
            onPressed: () {
              delete_data_post();
            },
            child: const Text("DELETE POST"),
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
