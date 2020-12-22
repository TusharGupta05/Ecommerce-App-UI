import 'package:flutter/material.dart';
import 'package:get/get.dart';

infiniteItemList(List<String> paths, List<String> titles,
    List<String> subtitles1, List<String> subtitles2) {
  double itemWidth = Get.size.width / 2 - 25;
  List<Widget> widgets = List<Widget>.generate(
      paths.length,
      (i) =>
          item(paths[i], titles[i], subtitles1[i], subtitles2[i], itemWidth));
  widgets.add(Card(child: Container(height: itemWidth + 96,width: itemWidth,alignment: Alignment.center,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("View All", style: TextStyle(fontSize: 18),), Icon(Icons.arrow_forward_ios_sharp)],),)));
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "  Your Recently Viewed Items",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: itemWidth + 96,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widgets,
          ),
        ),
      ],
    ),
  );
}

Widget item(String path, String title, String subtitle1, String subtitle2,
    double width) {
  return Card(
    child: Container(
      width: width,
      height: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                path,
                width: width,
                height: width,
                fit: BoxFit.contain,
              ),
              ListTile(
                  isThreeLine: true,
                  tileColor: Colors.white,
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: subtitle1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                    TextSpan(text: "  "),
                    TextSpan(
                        text: subtitle2,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.7),
                          decoration: TextDecoration.lineThrough,
                        ))
                  ])))
            ],
          ),
        ],
      ),
    ),
  );
}
