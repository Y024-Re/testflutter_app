import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter_app/main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Y02塾"),
          ),
          body: Center(
            child: Column(
              children: [
                Text(
                  HelloWorldText,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                RaisedButton(
                  child: Text('ボタン'),
                  onPressed: () {
                    //何かをする
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
