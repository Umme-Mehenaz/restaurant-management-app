import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restsurantapp/chef/chefhome.dart';
import 'package:restsurantapp/chef/chefmodel.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/chef/chefsignup.dart';
import 'package:restsurantapp/singin.dart';

class ChefLogin extends StatefulWidget {
  const ChefLogin({super.key});

  @override
  State<ChefLogin> createState() => _ChefLoginState();
}

class _ChefLoginState extends State<ChefLogin> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<ChefModel> singinChef() async {
    ChefModel s = ChefModel(
        chef_id: int.parse(_id.text),
        chef_name: _name.text,
        email: _email.text,
        password: _password.text);
    final response = await http.post(
        Uri.parse('http://192.168.0.72:8080/chef_singin'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      return ChefModel.fromJson(jsonDecode(response.body));
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
          Text("SignIn",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
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
              ChefModel c = await singinChef();
              if (c != null && (c.chef_id == int.parse(_id.text))) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ChefHome()));
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
                  context, MaterialPageRoute(builder: (context) => ChefSignup()));
            },
            child: Text("Go signup"),
          ),
        ],
      ),
    );
  }
}
