// To parse this JSON data, do
//
//     final itemData = itemDataFromJson(jsonString);

import 'dart:convert';

ItemData itemDataFromJson(String str) => ItemData.fromJson(json.decode(str));

String itemDataToJson(ItemData data) => json.encode(data.toJson());

class ItemData {
  ItemData({
    this.id,
    this.name,
    this.image,
    this.offerImage,
    this.category,
    this.test,
    this.time,
    this.rating,
    this.price,
    this.type,
    this.quantity,
  });

  String id;
  String name;
  String image;
  String offerImage;
  String category;
  String test;
  String time;
  String rating;
  int price;
  String type;
  int quantity;

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    offerImage: json["offerImage"],
    category: json["catagory"],
    test: json["test"],
    time: json["time"],
    rating: json["rating"],
    price: json["price"],
    type: json["type"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "offerImage": offerImage,
    "catagory": category,
    "test": test,
    "time": time,
    "rating": rating,
    "price": price,
    "type": type,
    "quantity": quantity,
  };
}
