import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomScrollView topOffers() {
  double itemWidth = Get.size.width / 2 - 25;
  double itemHeight = Get.size.height / 4;
  List<String> paths = List<String>.generate(
      12, (index) => "assets/topoffers/a${index + 1}.jpeg");
  List<String> title1 = [
    "Electric Kettles",
    "Panasonic Washing Machine",
    "Room Heaters",
    "LG Semi-automatic",
    "Living Room Chairs",
    "Bookshelves",
    "Cabinet & Drawers",
    "TV Units",
    "Cookware Set",
    "Water Bottles",
    "Gas Stove",
    "Mugs"
  ];
  List<String> title2 = [
    "Shop Now!",
    "From ₹999/m*",
    "Usha, Havells & more!",
    "From ₹849/m*",
    "From ₹7,990",
    "From ₹248",
    "From ₹349",
    "From ₹1,249",
    "From ₹499",
    "From ₹119",
    "₹499",
    "From ₹199"
  ];
  List<String> title3 = [
    "Prestige",
    "Festive Discounts!",
    "Upto 60% Off",
    "Grab or Gone Deals!",
    "For a clutter Free workstate",
    "With & Without Wall-Mount",
    "Modern & Trendy",
    "For Perfect Home",
    "Butterfly & more",
    "Cello & more",
    "Pigeon & more",
    "AMT & more"
  ];
  return CustomScrollView(
      primary: true,
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.blueAccent[700],
          title: Text("Top Offers"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.mic), onPressed: () {}),
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ],
        ),
        gridItem(
            itemWidth,
            itemHeight,
            paths.sublist(0, 4),
            title1.sublist(0, 4),
            title2.sublist(0, 4),
            "Top Offers On Appliances",
            title3:title3.sublist(0, 4),),
        gridItem(
            itemWidth,
            itemHeight,
            paths.sublist(4, 8),
            title1.sublist(4, 8),
            title2.sublist(4, 8),
            "Bestselling Furniture",
            title3:title3.sublist(0, 4),),
        gridItem(
            itemWidth,
            itemHeight,
            paths.sublist(8, 12),
            title1.sublist(8, 12),
            title2.sublist(8, 12),
            "Home Essentials & more",title3:title3.sublist(0, 4),),
      ]);
}

gridItem(double itemWidth, double itemHeight, List<String> paths,
    List<String> title1, List<String> title2, String title,
    {List<String> title3}) {
  List<Widget> list = List<Widget>();
  for (int i = 0; i < paths.length; i++) {
    if (title3 == null || title3.length == 0) {
      list.add(TwoTitles(paths[i], title1[i], title2[i], itemHeight, itemWidth));
    } else 
    list.add(
        item(paths[i], title1[i], title2[i], title3[i], itemWidth, itemHeight));
  }
  return SliverToBoxAdapter(
      child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.only(top: 5, left: 5, right: 5,),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue, Colors.green])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(title),
          Container(
              height: itemHeight * 2 + 20,
              width: itemWidth * 2,
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: itemWidth / itemHeight,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: list))
        ],
      ),
    ),
  ));
}

header(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      FlatButton(
          color: Colors.white,
          child: Row(
            children: [
              Text(
                "View All",
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ],
          ),
          onPressed: () {})
    ],
  );
}

class TwoTitles extends StatelessWidget {
  final String path, title1, title2;
  final double width, height;
  TwoTitles(this.path, this.title1, this.title2, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            path,
            height: height - 70,
            width: width,
            fit: BoxFit.contain,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title1,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text(
                title2,
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

item(String path, String title1, String title2, String title3, double width,
    double height) {
  return Card(
    margin: EdgeInsets.zero,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          path,
          height: height - 70,
          width: width,
          fit: BoxFit.contain,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title1,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              title2,
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
            Text(
              title3,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
