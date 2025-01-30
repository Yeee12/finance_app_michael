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

    final double maxExpense = expenses.fold(0.0, (prev, e) => e.amount > prev ? e.amount : prev);

    return Column(
      children: [
        SizedBox(
          height: 220.h,  // Make it responsive
          child: Stack(
            children: [
              // Expense Bars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: expenses.asMap().entries.map((entry) {
                  final index = entry.key;
                  final expense = entry.value;
                  final double barHeight = maxExpense > 0 ? (expense.amount / maxExpense) * 190.h : 0.0;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w), // Adjust spacing responsively
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: barHeight,
                          width: 45.w, // Increase bar width
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.grey.shade400, Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            // borderRadius: BorderRadius.circular(0.r),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h), // Add padding to move text up
                              child: Text(
                                '\$${expense.amount.toStringAsFixed(2)}',
                                style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 13.h),
                        Text(
                          expense.month,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              // Dashed Average Line
              if (maxExpense > 0)
                Positioned(
                  left: 0,
                  right: 0,
                  top: (1 - averageExpense / maxExpense) * 160.h,
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: Container(
                      height: 1,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              // Average Expense Label
              if (maxExpense > 0)
                Positioned(
                  right: 0,
                  top: (1 - averageExpense / maxExpense) * 130.h - 10,
                  child: Text(
                    '\$${averageExpense.toStringAsFixed(2)}',
                    style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double max = size.width;
    double dashWidth = 5.0;
    double dashSpace = 3.0;
    double startX = 0.0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
