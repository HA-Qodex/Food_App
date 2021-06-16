import 'package:fltr_food_app/views/home_page/home_page.dart';
import 'package:fltr_food_app/views/order_list_page.dart';
import 'package:fltr_food_app/views/profile_page.dart';
import 'package:fltr_food_app/views/wish_list_page.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  var currentIndex = 0.obs;
  var pages = [
    HomePage(),
    WishListPage(),
    OrderListPage(),
    ProfilePage()
  ].obs;
}