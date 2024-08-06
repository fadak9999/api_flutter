import 'package:api_flutter/%D8%A7%D9%88%D8%A7%D9%85%D8%B1%20%D8%A7%D8%AE%D8%B1%D9%89.dart';
import 'package:api_flutter/%D9%86%D8%B5%D9%8A%D8%AD%D8%A9.dart';
import 'package:api_flutter/GET/API_cats_get.dart';
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
      home: GetAdvice(),
    );
  }
}
