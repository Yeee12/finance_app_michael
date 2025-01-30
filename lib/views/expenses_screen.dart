import 'package:finance_app_michael/widgets/planned_expense_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/expenses_viewmodel.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ExpensesViewModel>(context);

    double heightMultiplier = 2.2; // Adjust this value to change the height of the bars

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeframe Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['W', 'M', '3M', '6M', 'Y', 'All'].map((timeFrame) {
                final isSelected = viewModel.selectedTimeFrame == timeFrame;
                return GestureDetector(
                  onTap: () => viewModel.updateTimeFrame(timeFrame),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      timeFrame,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24), // Space between timeframe selector and chart

            // Expense Chart
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling for the chart
              child: Row(
                children: viewModel.expenses.map((expense) {
                  final maxExpense = viewModel.expenses.isNotEmpty
                      ? viewModel.expenses.map((e) => e.amount).reduce((a, b) => a > b ? a : b)
                      : 0.0;

                  final barHeight = maxExpense > 0
                      ? (expense.amount / maxExpense) * 150 * heightMultiplier
                      : 0.0;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$${expense.amount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 40,
                          height: barHeight.isFinite ? barHeight : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: expense.color, // assigned color dynamically
                          ),
                        ),

                        const SizedBox(height: 4),
                        Text(
                          expense.month,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40), // Space between expense chart and planned expense progress

            // Planned Expense Progress Section
            PlannedExpenseProgress(
              plannedExpenses: viewModel.plannedExpenses,
              totalPlannedExpenses: viewModel.totalPlannedExpenses,
            ),
          ],
        ),
      ),
    );
  }
}
