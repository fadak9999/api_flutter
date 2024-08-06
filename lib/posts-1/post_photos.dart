import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostPhotos extends StatefulWidget {
  const PostPhotos({super.key});

  @override
  State<PostPhotos> createState() => _PostPhotosState();
}

class _PostPhotosState extends State<PostPhotos> {
  //
  List photos = [];

  Future<void> addPhotos() async {
    String url = "https://jsonplaceholder.typicode.com/photos";

    var response = await http.post(Uri.parse(url), body: {
      "title": "Api Photos (post)",
      "url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZaCXQ69FPTdyU6N53E2gtQEGs13jDvUoGFA&s",
      "thumbnailUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZaCXQ69FPTdyU6N53E2gtQEGs13jDvUoGFA&s",
    });

    if (response.statusCode == 201) {
      var responseBody = convert.jsonDecode(response.body);
      setState(() {
        photos.add(responseBody);
      });

      print(responseBody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API Post",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: addPhotos,
            child: const Text("Add API Photos"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Text(
                      photos[i]['title'],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 200,
                      width: 200,
                      child: Image.network(photos[i]['url']),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.network(photos[i]['thumbnailUrl']),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
