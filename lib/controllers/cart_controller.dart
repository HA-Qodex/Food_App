import 'package:fltr_food_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var cartList = <ItemData>[].obs;
  var subTotal = 0.obs;
  var shipping = 10.obs;
  var discount = 0.obs;

  int get cartSize => cartList.length;

  void addToCart(ItemData itemData) async {
    await Future.delayed(Duration(microseconds: 1000));
    if (!cartList.contains(itemData)) {
      ItemData itemsData = ItemData(
          id: itemData.id,
          image: itemData.image,
          name: itemData.name,
          price: itemData.price,
          quantity: 1);
      cartList.add(itemsData);
      subTotal.value += itemData.price;
      Get.snackbar(
        "Success",
        "Item is added to cart",
        icon: Icon(Icons.done, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFF5F6F8),
      );
      Get.forceAppUpdate();
    } else {
      Get.snackbar(
        "Success",
        "Item is already added to cart",
        icon: Icon(Icons.done, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFF5F6F8),
      );
      Get.forceAppUpdate();
    }
  }

  void increment(ItemData itemData) {
    itemData.quantity++;
    subTotal.value += itemData.price;
    Get.forceAppUpdate();
  }

  void decrement(ItemData itemData) {
    if (itemData.quantity > 1) {
      itemData.quantity--;
      subTotal.value -= itemData.price;
      Get.forceAppUpdate();
    }
  }

  int itemPrice(ItemData itemData) {
    if (itemData.quantity > 1) {
      int itemTotal = itemData.quantity * itemData.price;
      return itemTotal;
    }
    return itemData.price;
  }
  int get total => (subTotal.value + shipping.value - discount.value);
}