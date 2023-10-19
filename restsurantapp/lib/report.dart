import 'package:flutter/material.dart';
import 'package:restsurantapp/api_service.dart';
import 'package:restsurantapp/foodmodel.dart';
import 'package:restsurantapp/home2.dart';
import 'package:restsurantapp/order/order_api.dart';
import 'package:restsurantapp/order/ordermodel.dart';
import 'package:restsurantapp/updateitem.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final ApiService _apiService = ApiService();

  List<OrderModel>? lists = [];

  void findFood() async {
    lists = await _apiService.fetchReport();
    setState(() {});
  }

  Future<int> findFood2() async {
    lists = await _apiService.fetchReport();
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
                      Text(
                        '${lists![index].food_name.toString()}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('${lists![index].price.toString()}'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${lists![index].catagori.toString()}'),
                    ],
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.all(5),
            ),
          );
        },
      ),
    );
  }
}
