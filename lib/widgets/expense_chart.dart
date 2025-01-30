import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_colors.dart';
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
    if (expenses.isEmpty) {
      return Center(
        child: Text(
          "No expenses available",
          style: GoogleFonts.roboto(
            fontSize: 16.sp,  // Responsive font size
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    final double maxExpense = expenses.map((e) => e.amount).reduce((a, b) => a > b ? a : b);

    return Column(
      children: [
        SizedBox(
          height: 200.h,  // Make it responsive
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers bars closer together
            crossAxisAlignment: CrossAxisAlignment.end,
            children: expenses.map((expense) {
              final double barHeight = maxExpense > 0 ? (expense.amount / maxExpense) * 130.h : 0.0;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w), // Adjust spacing responsively
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${expense.amount.toStringAsFixed(2)}',
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,  // Responsive text
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h), // Responsive space
                    Container(
                      height: barHeight,
                      width: 5.w, // Responsive bar width
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(10.r), // Responsive border radius
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      expense.month,
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
