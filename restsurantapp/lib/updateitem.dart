import 'dart:convert';
import 'package:restsurantapp/admin.dart';
import 'package:restsurantapp/deleteitem.dart';
import 'package:restsurantapp/foodmodel.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:restsurantapp/order/home2.dart';

class Update extends StatefulWidget {
  final FoodModel? foodToEdit;

  const Update({super.key, this.foodToEdit});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController food_id = TextEditingController();
  TextEditingController food_name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController catagori = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController img = TextEditingController();

  bool isEditMode = false;
  late FoodModel foodModel;
  Future<void> updateFood() async {

    int getFood_id = int.parse(food_id.text.toString());
    String getFood_name = food_name.text.toString();
    double getPrice = double.parse(price.text.toString());
    String getCatagori = catagori.text.toString();
    int getQuantity = int.parse(quantity.text.toString());
    String getImg = img.text.toString();


    foodModel = FoodModel(food_id: getFood_id, food_name: getFood_name, price: getPrice, catagori: getCatagori, quantity: getQuantity, img: getImg);
    if(food_id.text.isNotEmpty){
      const url = 'http://192.168.0.72:8080/update';
      final uri = Uri.parse(url);
      final response = await http.post(
          uri,
          headers: {"content-type": "application/json"},
          body: jsonEncode(foodModel.toJson())
      );
    }

  }
  @override
  void initState() {
    super.initState();
    if (widget.foodToEdit != null) {
      isEditMode = true;
      food_id = TextEditingController(text: widget.foodToEdit?.food_id.toString());
    }
    food_name = TextEditingController(text: widget.foodToEdit?.food_name);
    price =
        TextEditingController(text: widget.foodToEdit?.price.toString());
    catagori =
        TextEditingController(text: widget.foodToEdit?.catagori);
    quantity =
        TextEditingController(text: widget.foodToEdit?.quantity.toString());


  }
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Update Food'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(5*2),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: food_id,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter food id';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'New id',
                      hintText: 'Enter food id',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: food_name,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter food name';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter food name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: price,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter food price';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'price',
                      hintText: 'Enter food price',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: catagori,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter catagori';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'catagori',
                      hintText: 'Emter catagori',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: quantity,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter quantity';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'quantity',
                      hintText: 'Enter quantity',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  controller: img,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter img';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'img',
                      hintText: 'Enter img',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),


              ElevatedButton(
                onPressed: (){
                  setState(() {
                    updateFood();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home2()));
                  });
                },
                child: Text( 'Update'),)

            ],
          ),
        ),
      ),
    );
  }
}
