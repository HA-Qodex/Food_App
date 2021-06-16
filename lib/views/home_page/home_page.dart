import 'package:badges/badges.dart';
import 'package:fltr_food_app/controllers/cart_controller.dart';
import 'package:fltr_food_app/controllers/food_controller.dart';
import 'package:fltr_food_app/views/home_page/popular_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'available_items.dart';
import 'hot_items.dart';
import 'new_items.dart';

class HomePage extends StatelessWidget {

  final foodController = Get.put(FoodController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Deliver to",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Text(
                    "Dhaka",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey, size: 30)
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5, top: 5),
            child: Badge(
              animationType: BadgeAnimationType.fade,
              animationDuration: Duration(microseconds: 1000),
              padding: EdgeInsets.all(3),
              position: BadgePosition(top: 3, end: -3),
              badgeColor: Colors.red,
              badgeContent: Text(
                "10",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
            ),
          )
        ],
        leading: IconButton(icon: Icon(Icons.restaurant_menu, size: 35,), onPressed: () {},)
      ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: GetX<FoodController>(
              builder: (controller) {
                return Column(
                  children: [
                    SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return HotItems(index: index);
                          },
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.hotList.length,
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _category("Breakfast", "assets/breakfast.png"),
                        _category("Lunch", "assets/lunch.png"),
                        _category("Dinner", "assets/dinner.png"),
                        _category("Drinks", "assets/drinks.png"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Popular Items",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PopularItems(index: index);
                          },
                          itemCount: controller.popularList.length,
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "New Items",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return NewItems(index: index);
                          },
                          itemCount: controller.newList.length,
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Available Items",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AvailableItems(index: index);
                      },
                      itemCount: controller.availableList.length,
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                );
              }
          ),
        )
    );
  }
  Widget _category(String category, String assets) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400], blurRadius: 5, spreadRadius: 2)
                ]),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    assets,
                  ),
                  radius: 25,
                ))),
        SizedBox(
          height: 5,
        ),
        Text(
          category,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}