import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iitd_task_ecommerce_app/Screens/allcategories.dart';
import 'package:iitd_task_ecommerce_app/Screens/topoffers.dart';
import 'package:iitd_task_ecommerce_app/widgets/ThreeItemsRow.dart';
import 'package:iitd_task_ecommerce_app/widgets/infineitemslist.dart';

import 'drawer.dart';

class LoggedOutUserScreen extends StatelessWidget {
  var index = 0.obs;
  var sliderInd = 0.obs;
  var location = Rx<String>('Your Location');
  var icon = Icons.location_off.obs;
  var animation = AlwaysStoppedAnimation(0.0).obs;
  List<String> paths = [
    'assets/offersimages/powerbank.jpeg',
    'assets/offersimages/trimmer.jpg',
    'assets/offersimages/badminton.jpeg',
    'assets/offersimages/books.jpeg'
  ];
  List<String> title1 = [
    'Powerbanks',
    'Trimmers',
    'Badminton Raquets',
    'Books'
  ];
  List<String> title2 = [
    'Min 30% Off',
    'Min 20% Off',
    'Min 50% Off',
    'Min 15% Off'
  ];
  List<String> threeItemsRowPath = [
    "assets/offersimages/poco.jpeg",
    "assets/offersimages/watches.jpeg",
    "assets/offersimages/shoes.jpeg"
  ];
  List<String> threeItemsRowHeadlines = [
    "Lowest Price Ever",
    "Last Day of Sale",
    "Extra 20% Off"
  ];
  List<String> threeItemsRowTitles = ["From ₹6,999", "From ₹599", "From ₹899"];
  List<String> threeItemsRowSubtitles = [
    "Poco C3",
    "Fossil, Titan & more",
    "Reebok, FILA & more"
  ];
  List<String> rvilpaths = [
    "assets/recently viewed/watch.jpeg",
    "assets/recently viewed/shirt.jpeg",
    "assets/recently viewed/trouser.jpeg",
    "assets/recently viewed/blazer.jpeg",
    "assets/recently viewed/shoes.jpeg"
  ];
  List<String> rviltitle = [
    "Timex TW00MF100 MF 13 Expedition Analog-Digital Watch - For Men",
    "Invictus Men Slim Fit Self Design Spread Collar Casual Shirt",
    "Invictus Slim Fit Men Blue Polycotton Trousers",
    "Invictus Self Design Single Breasted Casual Men Blazer  (Black)",
    "REEBOK Running Shoes For Men  (Black, White)"
  ];
  List<String> rvilsub1 = ["₹1,899", "₹849", "₹959", "₹1,499", "₹999"];
  List<String> rvilsub2 = ["₹4,145", "₹1,699", "₹2,399", "₹5,999", "₹2,299"];
  @override
  Widget build(BuildContext context) {
    double itemWidth = Get.size.width / 2 - 25;
    double itemHeight = Get.size.height / 4;
    Location();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            brightness: Brightness.dark,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blueAccent[700],
                statusBarIconBrightness: Brightness.light),
            elevation: 0,
          )),
      body: Obx(() => [
            CustomScrollView(
              slivers: [
                locationAppBar(context),
                searchTextField(),
                imagesSlider(0.obs),
                ThreeItemsRow(threeItemsRowHeadlines, threeItemsRowPath,
                    threeItemsRowTitles, threeItemsRowSubtitles),
                gridItem(itemWidth, itemHeight, paths, title1, title2,
                    "Discounts for You"),
                infiniteItemList(rvilpaths, rviltitle, rvilsub1, rvilsub2),
              ],
            ),
            categories(),
            topOffers(),
          ][index.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: index.value,
          onTap: (i) {
            index.value = i;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  index.value == 0 ? Icons.store : Icons.store_outlined,
                  color: index.value == 0
                      ? Colors.blueAccent[700]
                      : Colors.grey[700],
                ),
                label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps_sharp,
                  color: index.value == 1
                      ? Colors.blueAccent[700]
                      : Colors.grey[700],
                ),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                  index.value == 2
                      ? Icons.local_offer
                      : Icons.local_offer_outlined,
                  color: index.value == 2
                      ? Colors.blueAccent[700]
                      : Colors.grey[700],
                ),
                label: "Top Offers"),
          ],
        ),
      ),
      drawer: drawer(),
    );
  }

  SliverAppBar locationAppBar(BuildContext context) {
    return SliverAppBar(
      primary: false,
      floating: true,
      snap: true,
      pinned: false,
      elevation: 0,
      leadingWidth: 20,
      backgroundColor: Colors.blueAccent[700],
      actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
      ],
      title: Row(
        children: [
          Obx(() => IconButton(
                icon: Icon(icon.value, color: Colors.white),
                splashRadius: 10,
                onPressed: Location,
              )),
          Obx(() => Expanded(
                  child: Text(
                location.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: location.value.length < 30 ? 16 : 14,
                  fontStyle: FontStyle.italic,
                ),
              ))),
        ],
      ),
    );
  }

  SliverAppBar searchTextField() {
    return SliverAppBar(
      backgroundColor: Colors.blueAccent[700],
      centerTitle: true,
      expandedHeight: 40,
      collapsedHeight: 60,
      primary: true,
      pinned: true,
      // floating: true,
      leadingWidth: 0,
      leading: SizedBox(
        height: 0,
        width: 0,
      ),
      title: Container(
        alignment: Alignment.center,
        height: 40,
        color: Colors.white,
        child: TextField(
          cursorWidth: 1.0,
          cursorColor: Colors.black,
          style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 2),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.5),
              size: 25,
            ),
            suffixIcon: Icon(
              Icons.mic,
              color: Colors.black.withOpacity(0.5),
              size: 25,
            ),
            border: InputBorder.none,
            hintText: "Search for products, brands and more....",
            hintStyle: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  Future Location() async {
    return await Geolocator.checkPermission().then((value) async {
      if (value == LocationPermission.deniedForever) {
        location.value = "Your Location";
        icon.value = Icons.location_off;
        return;
      } else {
        Geolocator.requestPermission().then((value) {
          if (value == LocationPermission.always ||
              value == LocationPermission.whileInUse) {
            location.value = "fetching location";
            icon.value = Icons.location_on;
            Geolocator.getCurrentPosition(timeLimit: Duration(seconds: 60))
                .then((value) {
              Geocoder.local
                  .findAddressesFromCoordinates(
                      Coordinates(value.latitude, value.longitude))
                  .then((addresses) {
                location.value = addresses.first.addressLine.toString();
              });
            });
          }
        });
      }
    });
  }
}

Widget imagesSlider(sliderInd) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        onPageChanged: (i, k) {
                          sliderInd.value = i;
                        }),
                    items: [
                      "0.jpg",
                      "1.jpg",
                      "2.jpg",
                      "3.png",
                      "5.jpg",
                      "7.png"
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              height: 200,
                              width: Get.size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/" + i),
                                fit: BoxFit.fill,
                              )));
                        },
                      );
                    }).toList(),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          6,
                          (index) => Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sliderInd.value == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              )).toList(),
                    ),
                  ),
                ],
              ),
          childCount: 1));
}
