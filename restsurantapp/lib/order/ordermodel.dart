import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(
    json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {

  int id;
  String name;
  String email;
  int food_id;
  String food_name;
  double price;
  String catagori;
  int quantity;




  OrderModel({

    required this.id,
    required this.name,
    required this.email,
    required this.food_id,
    required this.food_name,
    required this.price,
    required this.catagori,
    required this.quantity,

  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(

    id: json["id"],
    name: json["name"],
    email: json["email"],
    food_id: json["food_id"],
    food_name: json["food_name"],
    price: json["price"],
    catagori: json["catagori"],
    quantity: json["quantity"],

  );

  Map<String, dynamic> toJson() => {

    "id": id,
    "name": name,
    "email": email,
    "food_id": food_id,
    "food_name": food_name,
    "price": price,
    "catagori": catagori,
    "quantity": quantity,

  };
}
