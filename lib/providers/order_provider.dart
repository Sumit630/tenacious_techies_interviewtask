import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/services/api/database_api.dart';
import '../views/order/order_model.dart';

class OrderProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Order> _orders = [];

  bool get isLoading => _isLoading;
  List<Order> get orders => _orders;

  Future<void> fetchOrders(String shopId) async {
    _isLoading = true;
    notifyListeners();

    final url =
        "${DatabaseApi.apiURL}$shopId";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success']) {
          _orders = OrderResponse.fromJson(responseData).orders;
        }
      }
    } catch (error) {
      print("Error fetching orders: $error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
