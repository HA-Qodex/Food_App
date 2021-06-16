import 'package:fltr_food_app/controllers/cart_controller.dart';
import 'package:fltr_food_app/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotItems extends StatelessWidget {
  final int index;

  HotItems({Key key, @required this.index}) : super(key: key);

  final foodController = Get.put(FoodController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetX<FoodController>(
        builder: (controller) {
          return GestureDetector(
            onTap: (){bottomSheet(context, index, controller);},
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 175,
                width: 300,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 5,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  controller.hotList[index].image,
                                ),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                offset: Offset(5, 3),
                                blurRadius: 5,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        constraints: BoxConstraints(maxHeight: 150, maxWidth: 250),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                text: TextSpan(
                                    text: "Now Only ",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                    children: [
                                      TextSpan(
                                        text: "\$${controller.hotList[index].price}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                            )),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(offset: Offset(-5, 5), color: Colors.white, blurRadius: 5)],
                            shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(controller.hotList[index].offerImage), fit: BoxFit.fill)),
                        //child: Image.network(controller.hotList[index].offerImage,),
                      ),
                      // CircleAvatar(
                      //   radius: 80,
                      //   backgroundColor: Colors.blue,
                      //   child: ClipOval(
                      //     child: Image.network(
                      //       controller.hotList[index].offerImage,
                      //       fit: BoxFit.fill,
                      //       height: 160,
                      //       width: 160,
                      //     ),
                      //   ),
                      // ),
                    ),
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
                        controller.hotList[index].image,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.hotList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),

                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                            "\$${controller.hotList[index].price}",
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
                          Text(controller.hotList[index].rating,
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
                          Text(controller.hotList[index].test,
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
                          Text(controller.hotList[index].category,
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
                        Text(controller.hotList[index].time,
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
                          controller.wishItems(controller.hotList[index]);
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
                              controller.hotList[index]);
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
