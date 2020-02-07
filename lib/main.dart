import 'package:flutter/material.dart';
import 'package:shopbackerclick/screens/home.dart';
import 'package:shopbackerclick/utility/my_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      title: MyConstant().appName,
      home: Home(),
    );
  }
}
