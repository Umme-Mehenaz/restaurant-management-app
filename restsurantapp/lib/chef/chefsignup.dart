import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restsurantapp/chef/cheflogin.dart';
import 'package:restsurantapp/chef/chefmodel.dart';
import 'package:http/http.dart' as http;

class ChefSignup extends StatefulWidget {
  const ChefSignup({super.key});

  @override
  State<ChefSignup> createState() => _ChefSignupState();
}

class _ChefSignupState extends State<ChefSignup> {
  TextEditingController _id= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();

  Future<ChefModel>singupChef()async{
    ChefModel s = ChefModel(chef_id:int.parse(_id.text),chef_name:_name.text, email: _email.text, password: _password.text);
    final response=
    await http.post(Uri.parse('http://192.168.0.72:8080/adsingup'),
        body: jsonEncode(s.toJson()),headers: {"content-type":"application/json"}
    );
    if(response.statusCode==200){
      return ChefModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("fail");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
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
          TextFormField(

            decoration: const InputDecoration(
              hintText: 'Enter your Email',
            ),

            controller: _email,
          ),
          TextFormField(

            decoration: const InputDecoration(
              hintText: 'Enter your Password',
            ),

            controller: _password,
          ),
          ElevatedButton(onPressed: ()async{
            ChefModel c=await singupChef();
            if(c!=null){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChefLogin()));
            }
            setState(() {

            });

          }, child: Text('SignUp'),
          ),
        ],
      ),
    );
  }
}
