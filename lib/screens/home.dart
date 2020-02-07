import 'package:flutter/material.dart';
import 'package:shopbackerclick/utility/my_constant.dart';
import 'package:shopbackerclick/utility/my_style.dart';
import 'package:shopbackerclick/widget/account.dart';
import 'package:shopbackerclick/widget/braket.dart';
import 'package:shopbackerclick/widget/main_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  List<Widget> showWidgets = [MainPage(), Braket(), Account()];

  int index = 0;

  // Method
  BottomNavigationBarItem homeNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home, size: MyStyle().myIconSize,),
      title: Text('หน้าหลัก'),
    );
  }

  BottomNavigationBarItem braketNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.add_shopping_cart, size: MyStyle().myIconSize,),
      title: Text('ตะกร้า'),
    );
  }

  BottomNavigationBarItem accountNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.account_box, size: MyStyle().myIconSize,),
      title: Text('บัญชี'),
    );
  }

  Widget myButtonNavBar() {
    return BottomNavigationBar(
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
      currentIndex: index,
      items: <BottomNavigationBarItem>[
        homeNav(),
        braketNav(),
        accountNav(),
      ],
    );
  }

  Widget searchButton() {
    return IconButton(
      tooltip: 'ค้นหา สินค้า',
      icon: Icon(
        Icons.search,
        color: Colors.white,size: MyStyle().myIconSize,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[searchButton()],
        backgroundColor: MyStyle().primaryColor,
        title: Text(
          MyConstant().appName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: showWidgets[index],
      bottomNavigationBar: myButtonNavBar(),
    );
  }
}
