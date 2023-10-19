import 'package:flutter/material.dart';
import 'package:restsurantapp/additem.dart';
import 'package:restsurantapp/api_service.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/updateitem.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final ApiService _apiService = ApiService();

  List<FoodModel>? lists = [];

  void findFood() async {
    lists = await _apiService.fetchCustomer();
    setState(() {});
  }

  Future<int> findFood2() async {
    lists = await _apiService.fetchCustomer();
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
            color: Colors.white70,
            shadowColor: Colors.deepOrange,
            surfaceTintColor: Colors.white70,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('${lists![index].food_id.toString()}'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Column(
                        children: [
              Text('${lists![index].food_name.toString()}',
                style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.bold,
                ),
                  ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text('${lists![index].price.toString()}'),
                          ),

                      Text('${lists![index].catagori.toString()}'),

                      Text('${lists![index].quantity.toString()}'),
                        ],
                      ),
                      SizedBox(width: 15,),

                    ],
                  ),


                ],
              ),
              contentPadding: const EdgeInsets.all(5),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      final foodToEdit = lists![index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Update(foodToEdit: foodToEdit),
                          ));
                    },
                    icon: const Icon(Icons.edit, color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Conform Delete'),
                              content: const Text(
                                  'Are you sure you want to delete this student?'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      _apiService
                                          .deleteitem(lists![index].food_id);
                                      setState(() {
                                        findFood2();
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home2()));
                                    },
                                    child: const Text('Delete'))
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
