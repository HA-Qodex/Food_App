import 'package:fltr_food_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodController extends GetxController{
  var productList = <ItemData>[].obs;
  var popularList = <ItemData>[].obs;
  var newList = <ItemData>[].obs;
  var availableList = <ItemData>[].obs;
  var hotList = <ItemData>[].obs;
  var wishList = <ItemData>[].obs;

  @override
  void onInit() {
    fetchData();
    popularItems();
    newItems();
    availableItems();
    hotItems();
    super.onInit();
  }

  void popularItems() async {
    await Future.delayed(Duration(microseconds: 1000));
    popularList.value =
        productList.where((data) => data.type == "popular").toList();
  }

  void newItems() async {
    await Future.delayed(Duration(microseconds: 1000));
    newList.value = productList.where((data) => data.type == "new").toList();
  }

  void availableItems() async {
    await Future.delayed(Duration(microseconds: 1000));
    availableList.value =
        productList.where((data) => data.type == "regular").toList();
  }

  void hotItems() async {
    await Future.delayed(Duration(microseconds: 1000));
    hotList.value = productList.where((data) => data.type == "offer").toList();
  }

  void wishItems(ItemData itemData) async {
    await Future.delayed(Duration(microseconds: 1000));
    if (!wishList.contains(itemData)) {
      wishList.add(itemData);
      Get.snackbar(
        "Success",
        "Item is aded to wishlist",
        icon: Icon(Icons.done, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFF5F6F8),
      );
    } else
      Get.snackbar(
        "Success",
        "Item is already added",
        icon: Icon(Icons.done, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFF5F6F8),
      );
  }

  void removeWishList(ItemData itemData) async {
    await Future.delayed(Duration(microseconds: 1000));
    wishList.removeWhere((data) => data == itemData);
  }

  void fetchData() async {
    await Future.delayed(Duration(microseconds: 1000));
    var foodList = [
      ItemData(
        id: "1",
        name: "Mini Burger",
        image:
        "https://freepngimg.com/thumb/burger/6-2-burger-png-image-thumb.png",
        offerImage: "",
        category: "Breakfast",
        test: "hot & spice",
        time: "5-7 min",
        rating: "4.2",
        price: 10,
        type: "popular",
      ),
      ItemData(
        id: "2",
        name: "pepperoni Pizza",
        image:
        "https://st.depositphotos.com/1900347/4146/i/600/depositphotos_41466555-stock-photo-image-of-slice-of-pizza.jpg",
        offerImage: "",
        category: "Breakfast",
        test: "Spice",
        time: "15-20 min",
        rating: "4.5",
        price: 12,
        type: "popular",
      ),
      ItemData(
        id: "3",
        name: "Pasta",
        image:
        "https://www.zegrahm.com/sites/zeg/files/styles/panopoly_image_original/public/pasta.jpg?t=1JeOaT&itok=eZRuyk0X",
        offerImage:
        "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/131492097/original/d6695193c4e29c872b25eb869e3d03c8a7fb7d30/design-a-professional-food-and-menu-posters-and-flyers.jpg",
        category: "lunch",
        test: "hot & spice",
        time: "10-15 min",
        rating: "4.5",
        price: 8,
        type: "offer",
      ),
      ItemData(
        id: "4",
        name: "Seafood paella",
        image:
        "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_634,c_fill,g_auto,h_357,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170206165040-dubai-michelin-dining-boca.jpg",
        offerImage:
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/a696b9103130059.5f464ec8eb377.png",
        category: "dinner",
        test: "hot & spice",
        time: "20-25 min",
        rating: "4.7",
        price: 55,
        type: "offer",
      ),
      ItemData(
        id: "5",
        name: "Chicken parm",
        image:
        "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1100,c_fill,g_auto,h_619,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170920150817-chicken-parm.jpg",
        offerImage: "",
        category: "dinner",
        test: "hot & spice",
        time: "20-25 min",
        rating: "3.7",
        price: 45,
        type: "new",
      ),
      ItemData(
        id: "6",
        name: "Hamburger",
        image:
        "https://www.zegrahm.com/sites/zeg/files/styles/panopoly_image_original/public/hamburger.jpg?t=1JeOaV&itok=sLnI24ud",
        offerImage: "",
        category: "lunch",
        test: "hot & spice",
        time: "15-20 min",
        rating: "4.0",
        price: 10,
        type: "new",
      ),
      ItemData(
        id: "7",
        name: "Special Salad",
        image:
        "https://www.zegrahm.com/sites/zeg/files/styles/panopoly_image_original/public/salad.jpg?t=1JeOaU&itok=6DaFCjSv",
        offerImage:
        "https://img.pikbest.com/01/38/75/66rpIkbEsTw67.jpg-1.jpg!bw700",
        category: "dinner",
        test: "hot & spice",
        time: "10-15 min",
        rating: "4.6",
        price: 30,
        type: "offer",
      ),
      ItemData(
        id: "8",
        name: "Fajitas",
        image:
        "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_634,c_fill,g_auto,h_357,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170203151539-fajitas.jpg",
        offerImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6ZzuXLYS_-O9_W7cG75zaUzJv5VIxUwYjQ&usqp=CAU",
        category: "breakfast",
        test: "hot & spice",
        time: "13-15 min",
        rating: "4.2",
        price: 55,
        type: "offer",
      ),
      ItemData(
        id: "9",
        name: "Chicken Pasta",
        image:
        "https://cdn.tasteatlas.com/images/toplistarticles/fc20fbcfe5cd4690ba0cb9614192303a.jpg?mw=1300.jpg",
        offerImage: "",
        category: "lunch",
        test: "hot & spice",
        time: "20-25 min",
        rating: "4.0",
        price: 20,
        type: "popular",
      ),
      ItemData(
        id: "10",
        name: "Satay",
        image:
        "https://cdn.tasteatlas.com/images/dishes/49e0e32425aa469b91d926707db3b849.jpg?mw=1300",
        offerImage: "",
        category: "dinner",
        test: "hot & spice",
        time: "20-25 min",
        rating: "3.7",
        price: 65,
        type: "regular",
      ),
      ItemData(
        id: "11",
        name: "Éclair",
        image:
        "https://cdn.tasteatlas.com/Images/Dishes/5af8a479dedb4d53a7718ca752a536eb.jpg?mw=1300",
        offerImage: "",
        category: "breakfast",
        test: "sweet",
        time: "0-5 min",
        rating: "4.4",
        price: 15,
        type: "popular",
      ),
      ItemData(
        id: "12",
        name: "Nougat",
        image:
        "https://cdn.tasteatlas.com/Images/Dishes/9d293caf1f9f47669f78a2d098ea590b.jpg?mw=1300",
        offerImage: "",
        category: "breakfast",
        test: "sweet",
        time: "0-5 min",
        rating: "4.8",
        price: 10,
        type: "new",
      ),
      ItemData(
        id: "13",
        name: "Bruschetta",
        image:
        "https://cdn.tasteatlas.com/images/dishes/eeeabf62647b459391edfd213800583b.jpg?mw=1300",
        offerImage: "",
        category: "dinner",
        test: "sweet",
        time: "10-15 min",
        rating: "3.9",
        price: 25,
        type: "new",
      ),
      ItemData(
        id: "14",
        name: "Pizza Napoletana",
        image:
        "https://cdn.tasteatlas.com/images/dishes/80601c2f1ddf4d8faa8238d795654f5d.jpg?mw=1300",
        offerImage:
        "https://i.pinimg.com/originals/d8/c2/81/d8c281a54dd35c07aa9c1819da49d958.jpg",
        category: "lunch",
        test: "hot & spice",
        time: "20-25 min",
        rating: "4.2",
        price: 25,
        type: "offer",
      ),
      ItemData(
        id: "15",
        name: "Spring Rolls",
        image:
        "https://cdn.tasteatlas.com/Images/Dishes/b151eebf5805474aa899f41b8c331b56.jpg?mw=1300",
        offerImage: "",
        category: "lunch",
        test: "hot & spice",
        time: "15-20 min",
        rating: "4.3",
        price: 15,
        type: "popular",
      ),
      ItemData(
        id: "16",
        name: "Borek",
        image:
        "https://cdn.tasteatlas.com/images/dishes/44cdf26d39234f5aa01b70030e4e848c.jpg?mw=1300",
        offerImage: "",
        category: "dinner",
        test: "sweet & spice",
        time: "10-15 min",
        rating: "3.7",
        price: 8,
        type: "new",
      ),
      ItemData(
        id: "17",
        name: "Quesadilla",
        image:
        "https://cdn.tasteatlas.com/images/dishes/cde29cfce09c43b0acc43e19a77b845b.jpg?mw=1300",
        offerImage: "",
        category: "dinner",
        test: "hot & spicey",
        time: "20-25 min",
        rating: "4.2",
        price: 25,
        type: "regular",
      ),
      ItemData(
        id: "18",
        name: "Minute Maid",
        image:
        "https://worldstopinsider.com/wp-content/uploads/2019/05/9-2-1.jpg",
        offerImage: "",
        category: "drinks",
        test: "sweet",
        time: "0-5 min",
        rating: "3.7",
        price: 5,
        type: "regular",
      ),
      ItemData(
        id: "19",
        name: "Tropicana",
        image:
        "https://worldstopinsider.com/wp-content/uploads/2019/05/5-4-585x585.jpg",
        offerImage: "",
        category: "drinks",
        test: "sweet",
        time: "0-5 min",
        rating: "4.2",
        price: 15,
        type: "regular",
      ),
      ItemData(
        id: "20",
        name: "Langer’s",
        image:
        "https://worldstopinsider.com/wp-content/uploads/2019/05/3-4-585x585.jpg",
        offerImage: "",
        category: "drinks",
        test: "sweet",
        time: "0-5 min",
        rating: "4.0",
        price: 8,
        type: "regular",
      ),
      ItemData(
        id: "21",
        name: "Apple & Eve’s",
        image:
        "https://worldstopinsider.com/wp-content/uploads/2019/05/2-4.jpg",
        offerImage: "",
        category: "drinks",
        test: "sweet",
        time: "0-5 min",
        rating: "4.1",
        price: 10,
        type: "regular",
      )
    ];

    productList.value = foodList;
  }
}