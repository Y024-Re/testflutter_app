import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Y02塾"),
        ),
        body: Text(
          "Hello World",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
