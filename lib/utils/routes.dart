import 'package:finance_app_michael/views/home_screen.dart';
import 'package:flutter/material.dart';

import '../views/expenses_screen.dart';
import '../views/transaction_history_screen.dart';

class AppRoutes {
  static const String homeScreen = '/HomeScreen';
  static const String expenses = '/expenses';
  static const String transactionHistory = '/transactionHistory';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case expenses:
        return MaterialPageRoute(builder: (_) => ExpensesScreen());
      case transactionHistory:
        return MaterialPageRoute(builder: (_) => TransactionHistoryScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
