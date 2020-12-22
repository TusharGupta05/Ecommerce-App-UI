import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iitd_task_ecommerce_app/Screens/front_main_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.blueAccent[700], statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'IBM Plex Sans',
      ),
      home: LoggedOutUserScreen(),
    );
  }
}