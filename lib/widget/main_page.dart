import 'package:flutter/material.dart';
import 'package:shopbackerclick/utility/my_style.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Field

  // Method
  Widget rawMaterial() {
    double cardSize = 110.0;
    String pathIcon = 'images/cake.png';
    String titleIcon = 'Raw Material';
    Color color = Colors.limeAccent.shade100;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(pathIcon),
              width: 50,
              height: 50,
            ),
            Text(
              titleIcon,
              style: MyStyle().titleH3,
            )
          ],
        ),
      ),
      width: cardSize,
      height: cardSize,
    );
  }

  Widget groupCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        rawMaterial(),
        rawMaterial(),
        rawMaterial(),
      ],
    );
  }

  Widget titleCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Category',
          style: MyStyle().titleH2,
        ),
      ],
    );
  }

  Widget showCategory() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          titleCategory(),
          MyStyle().mySizebox,
          groupCategory(),
        ],
      ),
    );
  }

  Widget showBanner() {
    double heightBanner = 0.25; //* ความสูงของ Banner

    return Container(
      decoration: BoxDecoration(color: MyStyle().lightColor),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * heightBanner,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        showBanner(),
        showCategory(),
      ],
    );
  }
}
