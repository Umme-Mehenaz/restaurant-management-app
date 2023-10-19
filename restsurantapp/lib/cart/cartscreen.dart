import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restsurantapp/cart/cart_provider.dart';
import 'package:restsurantapp/cart/cartmodel.dart';
import 'package:restsurantapp/foodmodel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              // badgeContent: Text('0',style: TextStyle(color: Colors.white),),
              // animationDuration: Duration(milliseconds: 300),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context , AsyncSnapshot<List<CartModel>?> snapshot){
                if(snapshot.hasData){
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
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
                                              'images/${snapshot.data![index].img.toString()}'),
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
                                                "${snapshot.data![index].food_name.toString()}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Price : " +
                                                    "${snapshot.data![index].price.toString()}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Add To Cart ',
                                                      style: TextStyle(
                                                          color: Colors.white),
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
                          })
                  );
                }
                return Text('');
              })
        ],
      ),
    );
  }
}
