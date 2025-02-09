import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/color.dart';
import '../core/utils/const.dart';
import '../views/order/order_model.dart';
import 'custom_alert_dialog.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        title: Text(
          "Order ID: ${order.orderId}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text("POS User: ${order.posUserName}"),
            Text("Order Type: ${order.orderType}"),
            Text("KOT ID: ${order.kotId}"),
            Text("Start Time: ${formatDateTime(order.kotStartTime)}"),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.all(
            defaultPadding
          ),
          decoration: BoxDecoration(
            color: colorRed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            order.kotStatus,
            style: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(order: order),
          );
        },
      ),
    );
  }

  String formatDateTime(String dateTimeString) {
    try {
      DateTime parsedDate =
      DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateTimeString);
      return DateFormat("dd/MM/yyyy hh:mm a").format(parsedDate);
    } catch (e) {
      return dateTimeString;
    }
  }
}
