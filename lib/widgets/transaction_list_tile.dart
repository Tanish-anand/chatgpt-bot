import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;

  TransactionListTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.description),
      subtitle: Text('Date: ${transaction.date}'),
      trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
    );
  }
}
