import 'package:flutter/material.dart';
import 'package:restsurantapp/home.dart';
// import 'package:restsurantapp/login.dart';
import 'dart:convert';

List<Customer> customerFromJson(String str) => List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  int id;
  String name;
  String password;
  String email;

  Customer({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
