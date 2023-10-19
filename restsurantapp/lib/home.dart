import 'package:flutter/material.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:restsurantapp/menu/beverage.dart';
import 'package:restsurantapp/menu/burger.dart';
import 'package:restsurantapp/menu/chicken.dart';
import 'package:restsurantapp/menu/deals.dart';
import 'package:restsurantapp/menu/pizza.dart';
import 'package:restsurantapp/menu/snacks.dart';

import 'package:restsurantapp/singin.dart';
import 'package:restsurantapp/singup.dart';
import 'package:restsurantapp/map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Managemant App'),
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
              subtitle: const Text('new Food add'),
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 05,
          ),
          Image(
            image: AssetImage('images/res.jpg'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingIn()));
                },
                child: Text("Go signin"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Map()));
                },
                child: Text("Go to Our Location"),
              ),
            ],
          ),
          Row(
            children: [
              Image(
                image: AssetImage('images/pizza-1.jpg'),
                width: 120,
                height: 130,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Pizza',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳600',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pizza()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('images/burger.jpg'),
                width: 100,
                height: 130,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Burger',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳200',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Burger()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 05,
          ),
          Row(
            children: [
              Image(
                image: AssetImage('images/chicken.jpg'),
                width: 120,
                height: 130,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Chicken',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳150',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chicken()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('images/snacks.jpg'),
                width: 100,
                height: 120,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Snacks',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳600',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Snacks()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image(
                image: AssetImage('images/md2.jpg'),
                width: 120,
                height: 130,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Deals',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳599',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Deals()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('images/beverage.jpg'),
                width: 100,
                height: 120,
                fit: BoxFit.fill,
              ),
              SizedBox(),
              Column(
                children: [
                  Text(
                    'Beverage',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\৳499',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Beverage()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
