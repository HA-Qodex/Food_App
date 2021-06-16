import 'package:fltr_food_app/controllers/cart_controller.dart';
import 'package:fltr_food_app/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularItems extends StatelessWidget {
  final int index;
  PopularItems({Key key, @required this.index}) : super(key: key);

  final foodController = Get.put(FoodController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetX<FoodController>(
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              bottomSheet(context, index, controller);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                width: 250,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        width: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(controller.popularList[index].image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                height: 30,
                                width: 91,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Align(
                                  alignment: Alignment.center,
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
                                      Text(controller.popularList[index].time,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: 15,
                                child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: Colors.white,
                                    child:GestureDetector(
                                        onTap: () {
                                          controller
                                              .wishItems(controller.popularList[index]);
                                        },
                                        child: controller.wishList.contains(controller.popularList[index])
                                            ? Icon(
                                          Icons.favorite_outlined,
                                          size: 20,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite_outline,
                                          size: 20,
                                          color: Colors.black,
                                        ))
                                )),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.popularList[index].name,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 15,
                            child: Text("\$${controller.popularList[index].price}",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow,
                            ),
                            Text(controller.popularList[index].rating,
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
                            Text(controller.popularList[index].test,
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
                            Text(controller.popularList[index].category,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
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
                        controller.popularList[index].image,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.popularList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),

                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                            "\$${controller.popularList[index].price}",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      "Fast food refers to food that can be prepared and served quickly. It can come from many places: sit-down restaurants, counter service, take-out, drive-thru, and delivery. Fast food is popular because the food is inexpensive, convenient, and tastes good."),
                ),
                SizedBox(height: 10,),
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
                          Text(controller.popularList[index].rating,
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
                          Text(controller.popularList[index].test,
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
                          Text(controller.popularList[index].category,
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
                        Text(controller.popularList[index].time,
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
                          controller.wishItems(controller.popularList[index]);
                        },
                        child: Text(
                          "Add to wishlist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          cartController.addToCart(
                              controller.popularList[index]);
                        },
                        child: Text("Add to cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)))
                  ],
                ),
                SizedBox(height: 15,),
              ],
            ),
          );
        });
  }
}
