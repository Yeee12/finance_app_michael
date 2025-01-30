import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class PlannedExpenseProgress extends StatelessWidget {
  final List<PlannedExpense> plannedExpenses;
  final double totalPlannedExpenses;

  const PlannedExpenseProgress({
    Key? key,
    required this.plannedExpenses,
    required this.totalPlannedExpenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & "View Details"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Planned expenses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View details',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Total Amount
          Text(
            '\$${totalPlannedExpenses.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Progress Bar with Segments
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              children: plannedExpenses.asMap().entries.map((entry) {
                final int index = entry.key;
                final PlannedExpense expense = entry.value;

                return Expanded(
                  flex: (expense.percentage * 10).toInt(),
                  child: Container(
                    margin: EdgeInsets.only(right: index == plannedExpenses.length - 0.5 ? 0 : 1), // Add spacing between segments
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Adjust radius as needed
                      child: Container(
                        height: 20,
                        color: expense.color, // Assign unique colors
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Expense Breakdown List
          Column(
            children: plannedExpenses.map((expense) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: expense.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(expense.category),
                      ],
                    ),
                    Text('${expense.percentage.toStringAsFixed(1)}%'),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
