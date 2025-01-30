import 'package:finance_app_michael/core/app_colors.dart';
import 'package:finance_app_michael/widgets/expense_chart.dart';
import 'package:finance_app_michael/widgets/planned_expense_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/expenses_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';


class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ExpensesViewModel>(context);

    double heightMultiplier = 1.2; // Adjust this value to change the height of the bars

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: GoogleFonts.roboto(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeframe Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textSecondary,
                  width: 0.2, // Reduced border thickness
                ),
                borderRadius: BorderRadius.circular(20), // Single border radius
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['W', 'M', '3M', '6M', 'Y', 'All'].map((timeFrame) {
                  final isSelected = viewModel.selectedTimeFrame == timeFrame;
                  return GestureDetector(
                    onTap: () => viewModel.updateTimeFrame(timeFrame),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.card : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        timeFrame,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Expense Chart
            ExpenseChart(
              expenses: viewModel.expenses,
              averageExpense: viewModel.averageExpense, // Ensure this is available in your ViewModel
            ),

            const SizedBox(height: 40),

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
