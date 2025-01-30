import 'package:finance_app_michael/core/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/upcoming_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingPaymentItem extends StatelessWidget {
  final UpcomingPayment payment;

  const UpcomingPaymentItem({Key? key, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access textTheme

    return SizedBox(
      height: 140.h, // Ensuring a fixed height
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Enables smooth scrolling
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Prevents unnecessary expansion
            children: [
              // Row with Logo & Title
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        payment.imagePath,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      payment.title,
                      style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Price & Next Payment Date
              Text(
                "\$${payment.amount.toStringAsFixed(2)}",
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                payment.dueDate,
                style: textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
