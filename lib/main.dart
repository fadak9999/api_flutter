import 'package:api_flutter/Api.dart';
import 'package:api_flutter/Get_Api_user_.dart';
import 'package:api_flutter/Get_photos_Api_.dart';
import 'package:api_flutter/get_data.dart';
import 'package:api_flutter/post.dart';
import 'package:api_flutter/post_photos.dart';
import 'package:api_flutter/post_user.dart';
import 'package:api_flutter/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostUser(),
    );
  }
}
