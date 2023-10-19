// import 'package:restsurantapp/foodmodel.dart';

import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/main.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/order/ordermodel.dart';

import 'chef/chefmodel.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.0.108:8080';

  Future<List<FoodModel>?> fetchCustomer() async {
    final url = '$_baseUrl/alls';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<List<FoodModel>?> fetchCustomer2() async {
    final url = '$_baseUrl/update';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<void> deleteitem(int food_Id) async {
    final url = '$_baseUrl/deletes/$food_Id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    if (response.statusCode == 204) {
    } else if (response.statusCode == 404) {
      throw Exception('Food not found');
    } else {
      throw Exception('Failed to delete Food');
    }
  }
  Future<List<ChefModel>?> fetchChef() async {
    final url = '$_baseUrl/all_chef';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<ChefModel> data = chefModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<FoodModel>?> fetchPizza() async {
    final url = '$_baseUrl/selectfood';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<OrderModel>?> fetchReport() async {
    final url = '$_baseUrl/allsale';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<OrderModel> data = orderModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }


}

