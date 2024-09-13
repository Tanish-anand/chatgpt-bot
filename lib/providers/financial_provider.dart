import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/database_helper.dart';

class FinancialProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  Future<void> loadTransactions() async {
    _transactions = await DatabaseHelper().transactions();
    notifyListeners();
  }

  Future<void> addTransaction(Transaction transaction) async {
    await DatabaseHelper().insertTransaction(transaction);
    loadTransactions(); // Reload transactions after adding
  }
}
