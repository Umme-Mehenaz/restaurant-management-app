import 'package:flutter/material.dart';
import 'package:restsurantapp/api_service.dart';
import 'package:restsurantapp/cart/addcart.dart';
import 'package:restsurantapp/cart/cartmodel.dart';
import 'package:restsurantapp/customer/customer_home.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/home2.dart';
import 'package:restsurantapp/menu/menu_api.dart';
import 'package:restsurantapp/menu/pizza.dart';
import 'package:restsurantapp/order/order_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PDetails extends StatefulWidget {
  const PDetails({super.key});

  @override
  State<PDetails> createState() => _PDetailsState();
}

class _PDetailsState extends State<PDetails> {
  final MenuApi _apiService = MenuApi();
  final OrderApi _orderService = OrderApi();

  List<FoodModel>? lists = [];
  List<CartModel>? list =[];



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
                                      MaterialPageRoute(builder: (context) => Pizza()));
                                },
                              ),
                              TextButton(
                                child: const Text('ADD TO CART'),
                                onPressed: () async{
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  final int? id = prefs.getInt('id');
                                  final String? name = prefs.getString('name');
                                  final String? email = prefs.getString('email');
                                  CartModel cart = CartModel(food_id: lists![index].food_id, food_name: lists![index].food_name.toString(), price: lists![index].price, catagori:  lists![index].catagori.toString(), quantity: 1, img: lists![index].img.toString(), id: id!, name: name!, email: email!,sub_total:  lists![index].price!);
                                  _orderService.Cart(cart);
                                  setState(() {

                                  });},
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
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        tooltip: 'back',
        onPressed: ((){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddCart()));
        }),
        child: Icon(Icons.add),
      ),


    );
  }
}
