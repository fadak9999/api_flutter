import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class post_user extends StatefulWidget {
  const post_user({super.key});

  @override
  State<post_user> createState() => _post_userState();
}

class _post_userState extends State<post_user> {
  //

  List usere = [];

  Future<void> addusere() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    var response = await http.post(Uri.parse(url), body: {
      "name": "fadak",
      "username": "hhhhh",
      "email": "cattttssss----@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    });

    if (response.statusCode == 201) {
      var responseBody = convert.jsonDecode(response.body);
      setState(() {
        usere.add(responseBody);
      });

      print(responseBody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        ElevatedButton(onPressed: addusere, child: Text("post_user")),
        Expanded(
          child: ListView.builder(
            itemCount: usere.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  usere[index]['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username: ${usere[index]['username']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Email: ${usere[index]['email']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "Address: ${usere[index]['address']['street']}, ${usere[index]['address']['city']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "Geo: ${usere[index]['address']['geo']['lat']}, ___ ${usere[index]['address']['geo']['lng']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Phone: ${usere[index]['phone']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Company: ${usere[index]['company']['name']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
