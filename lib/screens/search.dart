import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopbackerclick/models/product_model.dart';
import 'package:shopbackerclick/utility/my_constant.dart';
import 'package:shopbackerclick/utility/my_style.dart';

class Search extends StatefulWidget {
  final int index;
  Search({Key key, this.index}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Field
  int index;
  List<ProductModel> productModels = List();

  // Method
  @override
  void initState() {
    super.initState();
    index = widget.index;
    print('index = $index');
    readData();
  }

  Future<void> readData() async {
    try {
      List<String> urls = MyConstant().apiReadProduct;
      Response response = await Dio().get(urls[index]);
      print('response = $response');

      for (var json in response.data) {
        print('json = $json');
        ProductModel productModel = ProductModel.fromJson(json);
        print('priductModel = $productModel');
        setState(() {
          productModels.add(productModel);
        });
      }
    } catch (e) {
      print('eReadData ==>> ${e.toString()}');
    }
  }

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
          color: Colors.black26, borderRadius: BorderRadius.circular(12.0)),
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

  Widget showProcess() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget showImage(int index) {
    String image = productModels[index].pic;

    if (image != null) {
      Uint8List uint8list = base64Decode(productModels[index].pic);
      return Container(
        height: 150.0,
        child: Image.memory(uint8list),
      );
    } else {
      return Container(
        height: 150.0,
        child: Image.asset('images/question.png'),
      );
    }
  }

  Widget showListView() {
    return ListView.builder(
        itemCount: productModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return Container(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  showImage(index),
                  Text(
                    productModels[index].name,
                    style: MyStyle().titleH3,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchForm(),
        leading: backButton(),
      ),
      body: productModels.length == 0 ? showProcess() : showListView(),
    );
  }
}
