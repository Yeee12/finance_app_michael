import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../models/expense_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.04),// Reduce shadow intensity
            blurRadius: 1, // Decreased from 8
            spreadRadius: 1, // Reduced spread
            // offset: const Offset(0, 1), // Less shadow distance
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
              Text(
                'Planned expenses',
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View details',
                  style: GoogleFonts.roboto(
                    color: AppColors.blueText,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Total Amount
          Text(
            '\$${totalPlannedExpenses.toStringAsFixed(2)}',
            style: GoogleFonts.roboto(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),

          // Progress Bar with Segments
          SizedBox(
            height: 30.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Row(
                children: plannedExpenses.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final PlannedExpense expense = entry.value;

                  return Expanded(
                    flex: (expense.percentage * 10).toInt(),
                    child: Container(
                      margin: EdgeInsets.only(right: index == plannedExpenses.length - 1 ? 0 : 1.w),
                      decoration: BoxDecoration(
                        color: expense.color,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Expense Breakdown List
          Column(
            children: plannedExpenses.map((expense) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: expense.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          expense.category,
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${expense.percentage.toStringAsFixed(0)}%',
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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
