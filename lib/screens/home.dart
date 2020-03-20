import 'package:flutter/material.dart';
import 'package:shopbackerclick/screens/search.dart';
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
  String searchString;

  // Method
  BottomNavigationBarItem homeNav() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: MyStyle().myIconSize,
      ),
      title: Text('หน้าหลัก'),
    );
  }

  BottomNavigationBarItem braketNav() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.add_shopping_cart,
        size: MyStyle().myIconSize,
      ),
      title: Text('ตะกร้า'),
    );
  }

  BottomNavigationBarItem accountNav() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.account_box,
        size: MyStyle().myIconSize,
      ),
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

  Widget searchForm() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(12.0)),
      height: 50.0,
      child: TextField(
        onChanged: (value) => searchString = value.trim(),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 16.0,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyStyle().white1),
          hintText: 'ค้นหา สินค้า',
        ),
      ),
    );
  }

  IconButton searchIconButton() {
    return IconButton(
      tooltip: 'ค้นหา สินค้า',
      icon: Icon(
        Icons.search,
        color: Colors.white,
        size: MyStyle().myIconSize,
      ),
      onPressed: () {
        if (searchString == null || searchString.isEmpty) {
          print('Have Space');
        } else {
          routeToSearch();
        }
      },
    );
  }

  void routeToSearch() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return Search(
        searchString: searchString,
        index: 0,
      );
    });
    Navigator.of(context).push(materialPageRoute);
  }

  Widget myDrawer() {
    return Drawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: searchForm(),
        actions: <Widget>[searchIconButton()],
      ),
      body: showWidgets[index],
      bottomNavigationBar: myButtonNavBar(),
    );
  }
}
