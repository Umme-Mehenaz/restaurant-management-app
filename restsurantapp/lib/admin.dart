import 'package:flutter/material.dart';
import 'package:restsurantapp/additem.dart';
import 'package:restsurantapp/chef/chefsignup.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:restsurantapp/order/home2.dart';
import 'package:restsurantapp/singin.dart';
import 'package:restsurantapp/map.dart';
import 'package:restsurantapp/singup.dart';
import 'package:restsurantapp/updateitem.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Admin Management'),
            ),
            ListTile(
              title: const Text('Add New User'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SingUp()));
              },
              leading: const Icon(
                Icons.add,
                color: Colors.green,
              ),
              subtitle: const Text('new Admin add'),
            ),
            ListTile(
              title: const Text('Add New Chef'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChefSignup()));
              },
              leading: const Icon(
                Icons.add,
                color: Colors.green,
              ),
              subtitle: const Text('new Food add'),
            ),
            ListTile(
              title: const Text('Add New User'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SingUp()));
              },
              leading: const Icon(
                Icons.add,
                color: Colors.green,
              ),
              subtitle: const Text('new Food add'),
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Image(image: AssetImage('images/ad2.jpg')),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddFood()));
                },
                child: Text("Add New Food"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home2()));
                },
                child: Text("Update Food"),
              ),

              SizedBox(
                height: 10,
              ),


            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text('Album',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 210,
              ),
              Text('View All',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Image(image: AssetImage('images/fl1.jpg'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                  width: 05
              ),
              Image(image: AssetImage('images/adres.png'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 05,
              ),
              Image(image: AssetImage('images/fl3.png'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text('Album',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 210,
              ),
              Text('View All',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Image(image: AssetImage('images/fl4.jpg'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                  width: 05
              ),
              Image(image: AssetImage('images/fl2.jpg'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 05,
              ),
              Image(image: AssetImage('images/fl5.jpg'),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ],

          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text('Album',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 210,
              ),
              Text('View All',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
