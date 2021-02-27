import 'package:flutter/material.dart';
import 'package:flutterapps/PickVideo.dart';
import 'package:flutterapps/VideoPlayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PickVideo(),
    );
  }
}
