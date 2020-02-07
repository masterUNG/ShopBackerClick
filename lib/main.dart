import 'package:flutter/material.dart';
import 'package:shopbackerclick/screens/home.dart';
import 'package:shopbackerclick/utility/my_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Map<int, Color> color = {
    50: Color.fromRGBO(0, 125, 95, .1),
    100: Color.fromRGBO(0, 125, 95, .2),
    200: Color.fromRGBO(0, 125, 95, .3),
    300: Color.fromRGBO(0, 125, 95, .4),
    400: Color.fromRGBO(0, 125, 95, .5),
    500: Color.fromRGBO(0, 125, 95, .6),
    600: Color.fromRGBO(0, 125, 95, .7),
    700: Color.fromRGBO(0, 125, 95, .8),
    800: Color.fromRGBO(0, 125, 95, .9),
    900: Color.fromRGBO(0, 125, 95, 1)
  };

  @override
  Widget build(BuildContext context) {
    
    MaterialColor materialColor = MaterialColor(0xff007d5f, color);

    return MaterialApp(
      theme: ThemeData(primarySwatch: materialColor),
      debugShowCheckedModeBanner: false,
      title: MyConstant().appName,
      home: Home(),
    );
  }
}
