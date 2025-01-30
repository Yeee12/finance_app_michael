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

    return Container(
      padding: EdgeInsets.all(16.w),
      constraints: BoxConstraints(minHeight: 190.h), // Allows dynamic height
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
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
        mainAxisSize: MainAxisSize.min, // Allows content to define height
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.1), // Reduce shadow intensity
                      blurRadius: 1, // Decreased from 8
                      spreadRadius: 1, // Reduced spread
                      // offset: const Offset(0, 1), // Less shadow distance
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
          SizedBox(height: 20.h),

          // Price & Next Payment Date
          Text(
            "\$${payment.amount.toStringAsFixed(2)}",
            style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 10.h),
          Text(
            payment.dueDate,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
