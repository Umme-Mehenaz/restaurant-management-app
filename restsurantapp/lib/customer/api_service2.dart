
import 'package:restsurantapp/customer/customer_model.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/main.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:http/http.dart' as http;

class ApiService2 {
  final String _baseUrl = 'http://192.168.0.108:8080';

  Future<List<CustomerModel>?> fetchCustomer() async {
    final url = '$_baseUrl/all_customer';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<CustomerModel> data = customerModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }





}
