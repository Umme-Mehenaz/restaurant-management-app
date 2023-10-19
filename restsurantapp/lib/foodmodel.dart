import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(
    json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  int food_id;
  String food_name;
  double price;
  String catagori;
  int quantity;
  String img;



  FoodModel({
    required this.food_id,
    required this.food_name,
    required this.price,
    required this.catagori,
    required this.quantity,
    required this.img,

  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    food_id: json["food_id"],
    food_name: json["food_name"],
    price: json["price"],
    catagori: json["catagori"],
    quantity: json["quantity"],
    img: json["img"],


  );

  Map<String, dynamic> toJson() => {
    "food_id": food_id,
    "food_name": food_name,
    "price": price,
    "catagori": catagori,
    "quantity": quantity,
    "img": img,


  };
}

