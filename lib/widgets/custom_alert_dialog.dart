import 'package:flutter/material.dart';
import '../core/theme/color.dart';
import '../views/order/order_model.dart';

class CustomAlertDialog extends StatelessWidget {
  final Order order;

  const CustomAlertDialog({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Order Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 8),
              SingleChildScrollView(
                child: Column(
                  children: order.items
                      .map((item) => Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(item.itemName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Category: ${item.categoryName}"),
                          Text("Status: ${item.itemStatus}",
                              style: TextStyle(color: colorRed)),
                        ],
                      ),
                      trailing: Text(
                        "Qty: ${item.quantity}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorRed,
                  foregroundColor: colorWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
