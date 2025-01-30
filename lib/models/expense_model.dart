import 'package:flutter/material.dart';

class Expense {
  final String month;
  final double amount;
  final Color color;
  Expense(this.month, this.amount, {required this.color});
}

class PlannedExpense {
  final String category;
  final double percentage;
  final Color color;

  PlannedExpense({required this.category, required this.percentage, required this.color});
}
