import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class get_potos extends StatefulWidget {
  const get_potos({super.key});

  @override
  State<get_potos> createState() => get_potosState();
}

class get_potosState extends State<get_potos> {
  List photos = [];

  Future GET_data_photos() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responsebody = convert.jsonDecode(response.body);
      setState(() {
        photos = responsebody;
      });
      print(responsebody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    GET_data_photos();
  }

  @override
  Widget build(BuildContext context) {
    ///--
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      color: Colors.purple),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  width: 200,
                  child: Image.network(photos[i]['url']), // عرض الصورة
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                      photos[i]['thumbnailUrl']), // عرض الصورة المصغرة
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;

// class GetPhotos extends StatefulWidget {
//   const GetPhotos({super.key});

//   @override
//   State<GetPhotos> createState() => GetPhotosState();
// }

// class GetPhotosState extends State<GetPhotos> {
//   String photoUrl = '';

//   Future getCatPhoto() async {
//     String url = "https://api.thecatapi.com/v1/images/search";
//     var response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       var responseBody = convert.jsonDecode(response.body);
//       setState(() {
//         photoUrl = responseBody[0]['url'];
//       });
//       print(responseBody);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCatPhoto();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple[800],
//         centerTitle: true,
//         title: const Text(
//           "Cat Photo API",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: photoUrl.isNotEmpty
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Here is a cat photo:',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.all(20),
//                     height: 200,
//                     width: 200,
//                     child: Image.network(photoUrl), // عرض صورة القط
//                   ),
//                 ],
//               )
//             : CircularProgressIndicator(), // عرض مؤشر التحميل أثناء انتظار البيانات
//       ),
//     );
//   }
// }
