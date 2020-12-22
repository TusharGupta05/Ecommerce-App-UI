import 'package:flutter/material.dart';
import 'package:get/get.dart';

categories() {
  int count = Get.size.width > 500 ? 4 : 3;
  double width = (Get.size.width / count);
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        backgroundColor: Colors.blueAccent[700],
        title: Text("All Categories"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.mic), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      SliverGrid.count(
        crossAxisCount: count,
        children: [
          category("assets/categories/c1.png", "Electronics", width),
          category("assets/categories/c3.png", "Appliances", width),
          category("assets/categories/c2.png", "Fashion", width),
          category("assets/categories/c4.png", "Daily need", width),
          category("assets/categories/c5.png", "Furniture", width),
          category("assets/categories/c7.png", "Home", width),
          category("assets/categories/c8.png", "Mobiles", width),

          
          
        ],
      ),
    ],
  );
}

Card category(String path, String title, double width) {
  return Card(
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      height: width,
      width: width,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(path))),
      child: Text(title),
    ),
  );
}
