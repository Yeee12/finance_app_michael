import 'package:finance_app_michael/core/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ExpenseChart extends StatelessWidget {
  final List<Expense> expenses;
  final double averageExpense;

  const ExpenseChart({
    Key? key,
    required this.expenses,
    required this.averageExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) return const Center(child: Text("No expenses available"));

    final double maxExpense = expenses.map((e) => e.amount).reduce((a, b) => a > b ? a : b);

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [

              // Expense Bars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: expenses.map((expense) {
                  final double barHeight = maxExpense > 0 ? (expense.amount / maxExpense) * 180.0 : 0.0;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '\$${expense.amount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Container(
                        height: barHeight,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.accent, // Use AppColors.accent explicitly
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(expense.month, style: const TextStyle(fontSize: 12)),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
