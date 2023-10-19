import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/customer/customer_model.dart';
import 'package:restsurantapp/customer/customer_signup.dart';
import 'package:restsurantapp/home.dart';
import 'package:restsurantapp/menu/all.dart';
import 'package:restsurantapp/menu/pizza.dart';
import 'package:restsurantapp/menu/pizza_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PLogin extends StatefulWidget {
  const PLogin({super.key});

  @override
  State<PLogin> createState() => _PLoginState();
}

class _PLoginState extends State<PLogin> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;

  Future<CustomerModel> singinCustomer() async {
    CustomerModel s = CustomerModel(
        id: int.parse(_id.text),
        name: _name.text,
        email: _email.text,
        password: _password.text);
    final response = await http.post(
        Uri.parse('http://192.168.0.72:8080/singin'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      return CustomerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fail");
    }
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn page-1'),
      ),
      backgroundColor: Colors.grey,
      body: Column(

        children: [

          Text("Customer Login",
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          TextFormField(
            controller: _id,
            decoration: const InputDecoration(
              hintText: 'Enter your Id',
              hintStyle: TextStyle(
                fontSize: 30,
                color: Colors.purple,
              ),

            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your Name',
              hintStyle: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
            controller: _name,
          ),

          ElevatedButton(
            onPressed: () async {
              CustomerModel c = await singinCustomer();
              // Obtain shared preferences.
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('id', c.id);
              await prefs.setString('name', c.name);
              await prefs.setString('email', c.email);
              final int? counter = prefs.getInt('id');
              final String? customer_name = prefs.getString('name');
              final String? email1 = prefs.getString('email');

              print(counter);
              print(customer_name);
              print(email1);
              if (c != null && (c.id == int.parse(_id.text))) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wrong info")));
              }
              setState(() {

              });
            },
            child: Text('Login'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CSignUp()));
            },
            child: Text("Go signup"),
          ),
        ],
      ),
    );
  }
}
