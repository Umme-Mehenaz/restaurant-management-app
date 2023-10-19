// import 'package:restsurantapp/foodmodel.dart';

import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/main.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:http/http.dart' as http;

// import 'chef/chefmodel.dart';

class MenuApi {
  final String _baseUrl = 'http://192.168.0.108:8080';

  Future<List<FoodModel>?> fetchPizza() async {
    final url = '$_baseUrl/pizza';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<List<FoodModel>?> fetchBurger() async {
    final url = '$_baseUrl/burger';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<FoodModel>?> fetchChicken() async {
    final url = '$_baseUrl/chicken';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<FoodModel>?> fetchSnacks() async {
    final url = '$_baseUrl/snacks';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<FoodModel>?> fetchBeverage() async {
    final url = '$_baseUrl/beverage';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<FoodModel> data = foodModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<List<FoodModel>?> fetchDeals() async {
    final url = '$_baseUrl/deals';
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




}

