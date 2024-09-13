import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/financial_provider.dart';
import '../models/transaction.dart';
import '../widgets/transaction_list_tile.dart';

class FinancialScreen extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final financialProvider = Provider.of<FinancialProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Financial Tracker')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: financialProvider.transactions.length,
              itemBuilder: (context, index) {
                final transaction = financialProvider.transactions[index];
                return TransactionListTile(transaction: transaction);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final description = _descriptionController.text;
                    final amount = double.tryParse(_amountController.text) ?? 0.0;
                    if (description.isNotEmpty && amount > 0) {
                      final transaction = Transaction(
                        description: description,
                        amount: amount,
                        date: DateTime.now().toIso8601String(),
                      );
                      financialProvider.addTransaction(transaction);
                      _descriptionController.clear();
                      _amountController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
