import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restsurantapp/customer/customer_login.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/menu/menu_api.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  final MenuApi _apiService = MenuApi();

  List<FoodModel>? lists = [];

  void findFood() async {
    lists = await _apiService.fetchBurger();
    setState(() {});
  }

  Future<int> findBurger() async {
    lists = await _apiService.fetchBurger();
    setState(() {});
    return 0;
  }
  @override
  void initState() {
    super.initState();
    findFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
      ),
      body: ListView.builder(
        itemCount: lists!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: Column(
              children: [
                ListTile(
                  title: Text("${lists![index].food_name.toString()}"),
                  subtitle: Text("${lists![index].price.toString()}"),
                  trailing: Icon(Icons.favorite_outline),
                ),
                Container(
                  height: 150.0,
                  child: Ink.image(
                    image: AssetImage("images/${lists![index].img.toString()}"),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.centerLeft,
                  child: Text("Burger"),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text('Order Now'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CLogin()));
                      },
                    ),
                    TextButton(
                      child: const Text('LEARN MORE'),
                      onPressed: () {/* ... */},
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),

    );
  }
}
