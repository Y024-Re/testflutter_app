import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String HelloWorldText = 'Flutter';

  void changeHelloWorldText() {
    HelloWorldText = 'Flutter難しいない！';
    notifyListeners();
  }
}
