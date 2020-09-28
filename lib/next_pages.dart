import 'package:flutter/material.dart';

class NextY02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次の画面"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: RaisedButton(
            child: Text('戻る'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
