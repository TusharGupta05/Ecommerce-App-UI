import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreeItemsRow extends StatelessWidget {
  final List<String> headlines, paths, titles, subtitles;
  ThreeItemsRow(this.headlines, this.paths, this.titles, this.subtitles);
  @override
  Widget build(BuildContext context) {
    double width = (Get.size.width - 30) / 3;
    return SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(headlines.length, (i) => item(headlines[i], paths[i], titles[i], subtitles[i],width)),
      ),
    );
  }

  Widget item(String headline, String path, String title, String subtitle,
      double width) {
    return Card(
      child: Container(
        width: width,
        height: width+85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width,
              alignment: Alignment.center,
              child: Text(headline, style: TextStyle(fontSize: 10,)),
              color: Colors.yellowAccent[100],),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(path,width: width,height: width,fit: BoxFit.contain,),
                ListTile(
                  isThreeLine: false,
                  tileColor: Colors.white,
                  title: Text(title,style: TextStyle(fontSize: 14),),
                  subtitle: Text(subtitle,style: TextStyle(fontSize: 12),maxLines: 1, overflow: TextOverflow.ellipsis,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

