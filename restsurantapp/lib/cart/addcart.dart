import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restsurantapp/cart/cartmodel.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/cart/cart_provider.dart';
import 'package:http/http.dart' as http;
import 'package:restsurantapp/menu/menu_api.dart';
import 'package:restsurantapp/order/order_api.dart';

class AddCart extends StatefulWidget {
  final CartModel? foodToEdit;

  const AddCart({super.key, this.foodToEdit});

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  // TextEditingController food_id = TextEditingController();
  // TextEditingController food_name = TextEditingController();
  // TextEditingController price = TextEditingController();
  // TextEditingController catagori = TextEditingController();
  // TextEditingController quantity = TextEditingController();
  // TextEditingController img = TextEditingController();
  // List<FoodModel>? lists = [];
  //
  //
  // bool isEditMode = false;
  // late FoodModel foodModel;
  // Future<void> updateFood() async {
  //
  //   int getFood_id = int.parse(food_id.text.toString());
  //   String getFood_name = food_name.text.toString();
  //   double getPrice = double.parse(price.text.toString());
  //   String getCatagori = catagori.text.toString();
  //   int getQuantity = int.parse(quantity.text.toString());
  //   String getImg = img.text.toString();
  //
  //
  //   foodModel = FoodModel(food_id: getFood_id, food_name: getFood_name, price: getPrice, catagori: getCatagori, quantity: getQuantity, img: getImg);
  //   if(food_id.text.isNotEmpty){
  //     const url = 'http://192.168.0.72:8080/update';
  //     final uri = Uri.parse(url);
  //     final response = await http.post(
  //         uri,
  //         headers: {"content-type": "application/json"},
  //         body: jsonEncode(foodModel.toJson())
  //     );
  //
  //   }
  //
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.foodToEdit != null) {
  //     isEditMode = true;
  //     food_id = TextEditingController(text: widget.foodToEdit?.food_id.toString());
  //   }
  //   food_name = TextEditingController(text: widget.foodToEdit?.food_name);
  //   price =
  //       TextEditingController(text: widget.foodToEdit?.price.toString());
  //   catagori =
  //       TextEditingController(text: widget.foodToEdit?.catagori);
  //   quantity =
  //       TextEditingController(text: widget.foodToEdit?.quantity.toString());
  //
  //
  // }
  final OrderApi _apiService = OrderApi();

  List<CartModel>? lists = [];

  void findFood() async {
    lists = await _apiService.getCartList();
    setState(() {});
  }

  Future<int> findFood2() async {
    lists = await _apiService.getCartList();
    setState(() {});
    return 0;
  }

  @override
  void initState() {
    super.initState();
    findFood();
  }

  void changeQuantity(int foodId, int qty) async {
    String url = "http://192.168.0.108:8080/change-quantity?foodId=$foodId&qty=$qty";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      findFood2();
    } else {
      throw Exception('Fail to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Center(
              child: Badge(
                // badgeContent: Text('0',style: TextStyle(color: Colors.white),),
                // animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: lists!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                image: AssetImage(
                                    'images/${lists![index].img.toString()}'),
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                width: 03,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${lists![index].food_name.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Price : " +
                                          "${lists![index].price.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Sub Total : " +
                                          "${lists![index].sub_total.toString()}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      int q = lists![index].quantity!;
                                                      if(q == 1) return;
                                                      q--;
                                                      changeQuantity(lists![index].food_id!, q);
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                  Text(lists![index].quantity.toString()),
                                                  IconButton(
                                                    onPressed: () {
                                                      int q = lists![index].quantity!;
                                                      q++;
                                                      changeQuantity(lists![index].food_id!, q);
                                                    },
                                                    icon: Icon(Icons.add),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Consumer(builder: (context, value, child) {
            return Column(
              children: [
                // ReusableWidget(title: 'Sun total', value: r'$'+value?.getTotalPrice().toStringAsFixed(2),),
                // ReusableWidget(title: 'Discount 5%', value: r'$'+"20",),
                // ReusableWidget(title: 'total', value: r'$'+value?.getTotalPrice().toStringAsFixed(2),)
              ],
            );
          }),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatefulWidget {
  final String title, value;

  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
