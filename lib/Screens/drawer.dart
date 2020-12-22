import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Drawer drawer() {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blueAccent[700],
            padding: EdgeInsets.zero,
            height: Get.size.height / 8,
            child: AppBar(
              elevation: 0,
              bottomOpacity: 0,
              brightness: Brightness.dark,
              backgroundColor: Colors.blueAccent[700],
              leading: Icon(
                Icons.home,
                size: 25,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          item(FontAwesomeIcons.star,"Plus Zone"),
          divider(),
          item(Icons.apps_rounded, "All Categories"),
          divider(),
          item(Icons.language, "Choose Language"),
          divider(),
          item(Icons.local_offer, "Offer Zone"),
          item(FontAwesomeIcons.lock, "Sell on MyMart"),
          divider(),
          item(FontAwesomeIcons.shoppingBag, "My Orders"),
          item(FontAwesomeIcons.gift, "My Coupons"),
          item(FontAwesomeIcons.shoppingCart, "My Cart"),
          item(FontAwesomeIcons.solidHeart, "My Wishlist"),
          item(FontAwesomeIcons.solidUser, "My Account"),
          item(Icons.notifications, "My Notifications"),
          item(Icons.chat, "My Chats"),
          divider(),
          onlyTitle("Notification Preferences"),
          onlyTitle("Help Center"),
          onlyTitle("Privacy Policy"),
          onlyTitle("Legal"),
        ],
      ),
    ),
  );
}

SizedBox item(IconData iconData, String title) {
  return SizedBox(
    height: 50,
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14),
      ),
      leading: Icon(iconData,size: 18,),
    ),
  );
}

SizedBox onlyTitle(String title) {
  return SizedBox(
    height: 50,
    child: ListTile(
        title: Text(
      title,
      style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
    )),
  );
}

Divider divider() {
  return Divider(
    height: 1,
    thickness: 1,
    color: Colors.black.withOpacity(0.3),
  );
}
