import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenacious_techies_interviewtask/core/services/api/database_api.dart';
import '../../providers/order_provider.dart';
import '../../widgets/order_card.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<OrderProvider>(context, listen: false).fetchOrders(DatabaseApi.shopId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: orderProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : orderProvider.orders.isEmpty
          ? Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orderProvider.orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orderProvider.orders[index]);
        },
      ),
    );
  }
}
