import 'package:fltr_food_app/views/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData( primaryColor: Colors.cyan[300]),
      debugShowCheckedModeBanner: false,
      title: "Foody",
      home: BottomNavigation(),
    );
  }
}
