import 'dart:convert';

List<ChefModel> chefModelFromJson(String str) => List<ChefModel>.from(
    json.decode(str).map((x) => ChefModel.fromJson(x)));

String chefModelToJson(List<ChefModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChefModel {
  int chef_id;
  String chef_name;
  String password;
  String email;

  ChefModel({
    required this.chef_id,
    required this.chef_name,
    required this.password,
    required this.email,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) => ChefModel(
    chef_id: json["chef_id"],
    chef_name: json["chef_name"],
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "chef_id": chef_id,
    "chef_name": chef_name,
    "password": password,
    "email": email,
  };
}
