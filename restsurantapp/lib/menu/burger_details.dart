import 'package:flutter/material.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/menu/burger.dart';
import 'package:restsurantapp/menu/menu_api.dart';
import 'package:restsurantapp/menu/pizza_details.dart';

class BDtails extends StatefulWidget {
  const BDtails({super.key});

  @override
  State<BDtails> createState() => _BDtailsState();
}

class _BDtailsState extends State<BDtails> {

  final MenuApi _apiService = MenuApi();

  List<FoodModel>? lists = [];

  void findFood() async {
    lists = await _apiService.fetchPizza();
    setState(() {});
  }

  Future<int> findFood2() async {
    lists = await _apiService.fetchPizza();
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

            child: ListTile(

              subtitle: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Column(

                    children: [

                      Image(image: AssetImage('images/${lists![index].img.toString()}'),
                        width: 300,
                        height: 250,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('${"Food Id : " +lists![index].food_id.toString()}'),
                      ),

                      Text('${"Food Name : " +lists![index].food_name.toString()}'),

                      Text('${"Price : " +lists![index].price.toString()}'),


                      Text('${"Catagori : " +lists![index].catagori.toString()}'),
                      Row(
                        children: [
                          ButtonBar(
                            children: [
                              TextButton(
                                child: const Text('Order Now'),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Burger()));
                                },
                              ),
                              TextButton(
                                child: const Text('ADD TO CART'),
                                onPressed: () {Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PDetails()));},
                              )
                            ],
                          )
                        ],
                      ),
                    ],

                  ),

                ],
              ),


            ),
          );
        },
      ),

    );
  }
}
