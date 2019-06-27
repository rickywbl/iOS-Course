import 'package:flutter/material.dart';
import 'base/container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '懂车帝',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.green,
        appBarTheme: AppBarTheme(color: Colors.white )
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ContainerPage(),
      ),
    );
  }
}
