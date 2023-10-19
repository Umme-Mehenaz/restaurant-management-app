import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restsurantapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/singin.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController _id= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();

  Future<Customer>singupCustomer()async{
    Customer s = Customer(id:int.parse(_id.text),name:_name.text, email: _email.text, password: _password.text);
    final response=
    await http.post(Uri.parse('http://192.168.0.133:8080/singup'),
        body: jsonEncode(s.toJson()),headers: {"content-type":"application/json"}
    );
    if(response.statusCode==200){
      return Customer.fromJson(jsonDecode(response.body));
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
            Customer c=await singupCustomer();
            if(c!=null){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SingIn()));
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
