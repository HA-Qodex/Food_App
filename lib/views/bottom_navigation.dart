import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:fltr_food_app/controllers/cart_controller.dart';
import 'package:fltr_food_app/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'cart_page.dart';

class BottomNavigation extends StatelessWidget {

  final navigationController = Get.put(NavigationController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      floatingActionButton: Badge(
        badgeColor: Colors.red,
        padding: EdgeInsets.all(8),
        animationType: BadgeAnimationType.fade,
        animationDuration: Duration(microseconds: 1000),
        badgeContent: GetX<CartController>(builder: (controller) {
          return Text(
            ("${controller.cartSize}"),
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          );
        }),
        child: FloatingActionButton(
          backgroundColor: Colors.cyan[300],
          onPressed: () {
            Get.to(CartPage(),
                transition: Transition.leftToRight,
                duration: Duration(microseconds: 4000),
                curve: Curves.easeIn);
          },
          elevation: 0,
          child: Icon(
            Icons.shopping_cart,
            size: 25,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GetX<NavigationController>(builder: (controller) {
        return AnimatedBottomNavigationBar(
          height: 60,
          elevation: 5,
          backgroundColor: Colors.white,
          activeColor: Colors.cyan[300],
          iconSize: 30,
          gapLocation: GapLocation.center,
          activeIndex: controller.currentIndex.value,
          gapWidth: 80,
          inactiveColor: Colors.grey,
          rightCornerRadius: 10,
          leftCornerRadius: 10,
          notchSmoothness: NotchSmoothness.softEdge,
          splashColor: Colors.cyan[100],
          splashRadius: 30,
          splashSpeedInMilliseconds: 500,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          icons: [
            Icons.home_filled,
            Icons.favorite,
            Icons.reorder,
            Icons.person
          ],
        );
      }),
      body: GetX<NavigationController>(builder: (controller) {
        return controller.pages[controller.currentIndex.value];
      }),
    );
  }
}
