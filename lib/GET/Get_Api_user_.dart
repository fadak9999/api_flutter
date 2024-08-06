// import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;

// class GetApi extends StatefulWidget {
//   const GetApi({super.key});

//   @override
//   State<GetApi> createState() => _GetApiState();
// }

// class _GetApiState extends State<GetApi> {
//   List users = [];

//   Future<void> getData() async {
//     String url = "https://jsonplaceholder.typicode.com/users";
//     var response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       var responseBody = convert.jsonDecode(response.body);
//       setState(() {
//         users = responseBody;
//       });
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 165, 163, 166),
//         centerTitle: true,
//         title: const Text(
//           "API",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: users.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     users[index]['name'],
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Username: ${users[index]['username']}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text("Email: ${users[index]['email']}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text(
//                           "Address: ${users[index]['address']['street']}, ${users[index]['address']['city']}, ${users[index]['address']['geo']}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text("Phone: ${users[index]['phone']}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text("Company: ${users[index]['company']['name']}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           )),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  List users = [];

  Future<void> getData() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        var responseBody = convert.jsonDecode(response.body);
        setState(() {
          users = responseBody;
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } on Exception catch (e) {
      print('Failed to connect to the server: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    users[index]['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username: ${users[index]['username']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Email: ${users[index]['email']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          "Address: ${users[index]['address']['street']}, ${users[index]['address']['city']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          "Geo: ${users[index]['address']['geo']['lat']}, ___ ${users[index]['address']['geo']['lng']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Phone: ${users[index]['phone']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Company: ${users[index]['company']['name']}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
