
import 'package:flutter/material.dart';
import 'package:shopApp/providers/orders.dart' as oi;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final oi.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(title: Text('\$${order.amount}'),
        subtitle: Text(DateFormat('dd MM YYYY hh:mm').format(order.dateTime)),
        trailing: IconButton(icon: Icon(Icons.expand_more), onPressed: (){},),
        ),
      ],),
    );
  }
}