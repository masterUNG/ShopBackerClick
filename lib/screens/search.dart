import 'package:flutter/material.dart';
import 'package:shopbackerclick/utility/my_style.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Field

  // Method
  Widget cancelButton() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('ยกเลิก'),
    );
  }

  Widget searchForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12.0)
      ),
      height: 40.0,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.cancel,
            color: MyStyle().white1,
          ),
          hintStyle: TextStyle(color: MyStyle().white1),
          hintText: 'ค้นหา สินค้า',
          prefixIcon: Icon(
            Icons.search,
            color: MyStyle().white1,
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchForm(),
        leading: backButton(),
        backgroundColor: MyStyle().primaryColor,
      ),
    );
  }
}
