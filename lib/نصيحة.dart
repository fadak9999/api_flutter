import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetAdvice extends StatefulWidget {
  const GetAdvice({super.key});

  @override
  State<GetAdvice> createState() => _GetAdviceState();
}

class _GetAdviceState extends State<GetAdvice> {
  String advice = "";

  Future<void> getAdvice() async {
    String url = "https://api.adviceslip.com/advice";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = convert.jsonDecode(response.body);
      setState(() {
        advice = responseBody['slip']['advice'];
      });
      print(responseBody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getAdvice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 116, 141),
        centerTitle: true,
        title: const Text(
          "API_Advice    ᓚᘏᗢ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: advice.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  advice,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 82, 9, 138)),
                  textAlign: TextAlign.center,
                ),
              )
            : const CircularProgressIndicator(
                color: Colors.amber,
              ),
      ),
    );
  }
}
