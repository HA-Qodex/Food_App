import 'package:fltr_food_app/controllers/cart_controller.dart';
import 'package:fltr_food_app/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListPage extends StatelessWidget {
  WishListPage({Key key}) : super(key: key);

  final foodController = Get.put(FoodController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetX<FoodController>(builder: (controller) {
      return ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: controller.wishList.length,
          itemBuilder: (context, index) {
            return wishListItems(context, index, controller);
          });
    }));
  }

  Widget wishListItems(
      BuildContext context, int index, FoodController controller) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          bottomSheet(context, index, controller);
        },
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.wishList[index].name,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.dinner_dining,
                              size: 18,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(controller.wishList[index].category,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.whatshot_rounded,
                              size: 18,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(controller.wishList[index].test,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(controller.wishList[index].rating,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("(120)",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              size: 18,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(controller.wishList[index].time,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(controller.wishList[index].image),
                    radius: 75,
                  )),
              Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                          onTap: () {
                            controller
                                .removeWishList(controller.wishList[index]);
                          },
                          child: Icon(
                            Icons.delete_forever_outlined,
                            size: 20,
                            color: Colors.black,
                          )))),
              Positioned(
                bottom: 10,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("\$${controller.wishList[index].price}",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> bottomSheet(
      BuildContext context, int index, FoodController controller) async {
    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      child: Image.network(
                    controller.wishList[index].image,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.wishList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text("\$${controller.wishList[index].price}",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      "Fast food refers to food that can be prepared and served quickly. It can come from many places: sit-down restaurants, counter service, take-out, drive-thru, and delivery. Fast food is popular because the food is inexpensive, convenient, and tastes good."),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow,
                          ),
                          Text(controller.wishList[index].rating,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.whatshot_rounded,
                            size: 18,
                            color: Colors.orange,
                          ),
                          Text(controller.wishList[index].test,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.dinner_dining,
                            size: 18,
                            color: Colors.green,
                          ),
                          Text(controller.wishList[index].category,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          size: 18,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(controller.wishList[index].time,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          controller.removeWishList(controller.wishList[index]);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Remove from wishlist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          cartController.addToCart(controller.wishList[index]);
                        },
                        child: Text("Add to cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        });
  }
}
