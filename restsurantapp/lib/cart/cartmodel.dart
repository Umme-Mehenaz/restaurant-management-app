import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(
    json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {


  int ? food_id;
  String ? food_name;
  double ? price;
  String ? catagori;
  int ? quantity;
  String ? img;
  int ? id;
  String ? name;
  String ? email;
  double ? sub_total;



  CartModel({


    this.food_id,
    this.food_name,
    this.price,
    this.catagori,
    this.quantity,
    this.img,
    this.id,
    this.name,
    this.email,
    this.sub_total,


  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(


    food_id: json["food_id"],
    food_name: json["food_name"],
    price: json["price"],
    catagori: json["catagori"],
    quantity: json["quantity"],
    img: json["img"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    sub_total: json["sub_total"],

  );



  Map<String, dynamic> toJson() => {


    "food_id": food_id.toString(),
    "food_name": food_name,
    "price": price.toString(),
    "catagori": catagori,
    "quantity": quantity.toString(),
    "img": img,
    "id": id.toString(),
    "name": name,
    "email": email,
    "sub_total": sub_total,

  };
}
