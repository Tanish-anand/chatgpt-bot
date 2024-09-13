import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/financial_provider.dart';
import 'screens/financial_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FinancialProvider()..loadTransactions(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinancialScreen(),
    );
  }
}
