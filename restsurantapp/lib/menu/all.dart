import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restsurantapp/api_service.dart';
import 'package:restsurantapp/cart/cartmodel.dart';
import 'package:restsurantapp/customer/customer_login.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/menu/pizza_details.dart';
import 'package:restsurantapp/order/order_api.dart';
import 'package:restsurantapp/order/ordermodel.dart';
import 'package:http/http.dart' as http;

class All extends StatefulWidget {
  final FoodModel? foodToEdit;
  const All({super.key,  this.foodToEdit});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {

    final ApiService _apiService = ApiService();
    final OrderApi _orderService = OrderApi();

  List<FoodModel>? lists = [];

  get food_id => null;

  void findFood() async {
    lists = await _apiService.fetchCustomer();
    setState(() {});
  }

  Future<int> findPizza() async {
    lists = await _apiService.fetchCustomer();
    setState(() {});
    return 0;
  }

  /*Add*/
    // TextEditingController id = TextEditingController();
    // TextEditingController name = TextEditingController();
    // TextEditingController email = TextEditingController();
    // TextEditingController food_id = TextEditingController();
    // TextEditingController food_name = TextEditingController();
    // TextEditingController price = TextEditingController();
    // TextEditingController catagori = TextEditingController();
    // TextEditingController quantity = TextEditingController();
    // TextEditingController img = TextEditingController();
    //
    // bool isEditMode = false;
    // late OrderModel foodModel;
    // Future<void> addFood() async {
    //
    //   int getId = int.parse(id.text.toString());
    //   String getName = name.text.toString();
    //   String getEmail = email.text.toString();
    //   int getFood_id = int.parse(food_id.text.toString());
    //   String getFood_name = food_name.text.toString();
    //   double getPrice = double.parse(price.text.toString());
    //   String getCatagori= catagori.text.toString();
    //   int getQuantity = int.parse(quantity.text.toString());
    //   ;
    //
    //
    //   foodModel = OrderModel(id: getId, name: getName, email: getEmail, food_id: getFood_id, food_name: getFood_name, price: getPrice, catagori: getCatagori, quantity: getQuantity);
    //   if(food_id.text.isNotEmpty){
    //     const url = 'http://192.168.0.72:8080/cart';
    //     final uri = Uri.parse(url);
    //     final response = await http.post(
    //         uri,
    //         headers: {"content-type": "application/json"},
    //         body: jsonEncode(foodModel.toJson())
    //     );
    //   }
    //
    // }
    // @override
    // void initState() {
    //   super.initState();
    //   if (widget.foodToEdit != null) {
    //     isEditMode = true;
    //     id = TextEditingController(text: widget.foodToEdit?.id.toString());
    //   }
    //   name = TextEditingController(text: widget.foodToEdit?.name.toString());
    //
    // email = TextEditingController(text: widget.foodToEdit?.email.toString());
    // food_id = TextEditingController(text: widget.foodToEdit?.food_id.toString());
    //   food_name = TextEditingController(text: widget.foodToEdit?.food_name);
    //   price =
    //       TextEditingController(text: widget.foodToEdit?.price.toString());
    //   catagori = TextEditingController(text: widget.foodToEdit?.catagori);
    //   quantity =
    //       TextEditingController(text: widget.foodToEdit?.quantity.toString());
    //
    //   findFood();
    // }
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
                  child: Text("Pizza"),
                ),
                // ButtonBar(
                //   children: [
                //     TextButton(
                //       child: const Text(' Add To Cart'),
                //       onPressed: () {
                //
                //        setState(() {
                //          _orderService.
                //          fetchOrder();
                //        });
                //       },
                //     ),
                //     TextButton(
                //       child: const Text(''),
                //       onPressed: () {Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => PDetails()));},
                //     )
                //   ],
                // )
              ],
            ),
          );
        },
      ),

    );
  }
  }

