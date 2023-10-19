import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restsurantapp/admin.dart';
import 'package:restsurantapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/singup.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<Customer> singinCustomer() async {
    Customer s = Customer(
        id: int.parse(_id.text),
        name: _name.text,
        email: _email.text,
        password: _password.text);
    final response = await http.post(
        Uri.parse('http://192.168.0.133:8080/singin'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin page'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _id,
            decoration: const InputDecoration(
              hintText: 'Enter your Id',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your Name',
            ),
            controller: _name,
          ),

          ElevatedButton(
            onPressed: () async {
              Customer c = await singinCustomer();
              if (c != null && (c.id == int.parse(_id.text))) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Admin()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wrong info")));
              }
              setState(() {

              });
            },
            child: Text('Signin'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SingUp()));
            },
            child: Text("Go signup"),
          ),
        ],
      ),
    );
  }
}
