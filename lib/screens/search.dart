import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopbackerclick/models/pls_model.dart';
import 'package:shopbackerclick/models/product_limit_model.dart';
import 'package:shopbackerclick/models/product_model.dart';
import 'package:shopbackerclick/screens/detail_product.dart';
import 'package:shopbackerclick/utility/my_constant.dart';
import 'package:shopbackerclick/utility/my_style.dart';
import 'package:shopbackerclick/utility/normal_dialog.dart';

class Search extends StatefulWidget {
  final int index;
  final String searchString;
  Search({Key key, this.index, this.searchString}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Field
  int index;
  List<ProductModel> productModels = List();
  List<Widget> widgets = List();
  List<ProductLimitModel> productLimitModels = List();
  List<PlsModel> plsModels = List();

  String search;
  bool statusAlert = true;

  // Method
  @override
  void initState() {
    super.initState();
    index = widget.index;
    search = widget.searchString;
    // print('index = $index');
    readData();
  }

  Future<void> readData() async {
    try {
      List<String> urls = MyConstant().apiReadProduct;

      if (index == 0) {
        urls[0] = 'http://210.86.171.110:89/webapi3/api/limit?name=$search&start=1&end=12';
        print('url ===>>> ${urls[0]}');
      }

      Response response = await Dio().get(urls[index]);
      print('response = $response');

      int indexGridView = 0;

      for (var json in response.data) {
        
        ProductLimitModel limitModel = ProductLimitModel.fromJson(json);
       
        setState(() {
          productLimitModels.add(limitModel);
          Widget widget = createCard(limitModel, indexGridView);
          widgets.add(widget);
        });
        indexGridView++;
        print('index ====> $indexGridView');
      }
    } catch (e) {
      print('eReadData ==>> ${e.toString()}');
    }
  }

  Widget createCard(ProductLimitModel limitModel, int index) {
    return GestureDetector(
      onTap: () {
        print('You Click index $index');
        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) {
          return DetailProduct();
        });
        Navigator.of(context).push(route);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            showImage(index),
            showTextGritView(index),
          ],
        ),
      ),
    );
  }

  Widget showTextGritView(int index) {
    String string = productLimitModels[index].name;
    int amount = 20;

    if (string.length > amount) {
      string = string.substring(0, amount - 1);
      string = '$string ...';
    }
    return Text(string);
  }

  Widget cancelButton() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('ยกเลิก'),
    );
  }

  Widget searchButton() {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        if (productModels.length != 0) {
          productModels
              .removeWhere((ProductModel productModel) => productModel != null);
          widgets.removeWhere((Widget widget) => widget != null);
        }
        setState(() {
          readData();
        });
      },
    );
  }

  Widget searchForm() {
    if (search == null) {
      search = '';
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(12.0)),
      height: 40.0,
      child: TextFormField(
        onChanged: (value) {
          if (statusAlert) {
            // print('Show Alert');
            normalDialog(
                context, 'Tip And Technic', 'Search Many Word by Space Word');
            statusAlert = false;
            search = value.trim();
          } else {
            search = value.trim();
          }
        },
        style: TextStyle(color: Colors.white),
        initialValue: search,
        decoration: InputDecoration(
          prefix: SizedBox(
            width: 16.0,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyStyle().white1),
          hintText: 'ค้นหา สินค้า',
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
    // String image = '${productLimitModels[index].pic1}';
    String image = productLimitModels[index].pic1.toString();
    // print('image showImage ===>> $image');

    if (image != 'null') {
      Uint8List uint8list = base64Decode(productModels[index].pic);
      return Container(
        height: 50.0,
        child: Image.memory(uint8list),
      );
    } else {
      // print('Works');
      return Container(
        height: 50.0,
        child: Image.asset('images/question.png'),
      );
    }
  }

  Widget showGritView() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.extent(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        maxCrossAxisExtent: 150.0,
        children: widgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchForm(),
        leading: backButton(),
        actions: <Widget>[searchButton()],
      ),
      body: productLimitModels.length == 0 ? showProcess() : showGritView(),
    );
  }
}
