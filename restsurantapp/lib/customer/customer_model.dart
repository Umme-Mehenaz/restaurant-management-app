import 'dart:convert';

List<CustomerModel> customerModelFromJson(String str) => List<CustomerModel>.from(
    json.decode(str).map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  int id;
  String name;
  String password;
  String email;

  CustomerModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    name: json["name"],
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "password": password,
    "email": email,
  };
}
