import 'package:flutter/material.dart';
import 'base/container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '懂车帝',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white )
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ContainerPage(),
      ),
    );
  }
}
