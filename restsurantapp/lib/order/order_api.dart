// import 'package:restsurantapp/ordermodel.dart';
//
import 'dart:convert';

import 'package:restsurantapp/cart/cartmodel.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/order/ordermodel.dart';
import 'package:restsurantapp/main.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:http/http.dart' as http;

// import 'chef/chefmodel.dart';

class OrderApi {
  final String _baseUrl = 'http://192.168.0.108:8080';

  Future<List<OrderModel>?> fetchChefOrder() async {
    final url = '$_baseUrl/chefdata';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<OrderModel> data = orderModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<List<CartModel>?> getCartList() async {
    final url = '$_baseUrl/allcart';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<CartModel> data = cartModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  void Cart(CartModel cartModel) async {
    final url = '$_baseUrl/cart';
    final uri = Uri.parse(url);
    final response = await http.post(uri, headers: {"Content-Type": "application/json"}, body: jsonEncode(cartModel.toJson()));
    if (response.statusCode == 200) {
      //final List<CartModel> data = cartModelFromJson(response.body);
      //return data;
      print("success");
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<List<FoodModel>?> getFoodList() async {
    final url = '$_baseUrl/alls';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data.toList();
    } else {
      throw Exception('Fail to load data');
    }
  }
}
