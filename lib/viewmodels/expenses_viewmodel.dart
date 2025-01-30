import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ExpensesViewModel with ChangeNotifier {
  final List<Expense> _expenses = [
    Expense('Jul', 564.23, color: Colors.grey.shade800),
    Expense('Aug', 822.43, color: Colors.grey.shade700),
    Expense('Sep', 589.72, color: Colors.grey.shade600),
    Expense('Oct', 982.32, color: Colors.grey.shade500),
    Expense('Nov', 752.81, color: Colors.grey.shade400),
    Expense('Dec', 671.08, color: Colors.grey.shade300),
  ];

  final List<PlannedExpense> _plannedExpenses = [
    PlannedExpense(category: "Investment", percentage: 48, color: Colors.black),
    PlannedExpense(category: "Healthcare", percentage: 32, color: Colors.grey),
    PlannedExpense(category: "Self reward", percentage: 18, color: Colors.grey.shade300), // Corrected light grey
  ];

  String _selectedTimeFrame = 'M';

  List<Expense> get expenses => _expenses;
  List<PlannedExpense> get plannedExpenses => _plannedExpenses;

  double get totalPlannedExpenses =>
      _plannedExpenses.fold(0.0, (sum, item) => sum + item.percentage);

  String get selectedTimeFrame => _selectedTimeFrame;

  double get averageExpense =>
      _expenses.fold(0.0, (sum, e) => sum + e.amount) / _expenses.length;

  void updateTimeFrame(String timeFrame) {
    _selectedTimeFrame = timeFrame;
    notifyListeners();
  }
}
