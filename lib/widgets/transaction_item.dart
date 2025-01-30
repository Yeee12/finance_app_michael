import 'package:finance_app_michael/core/app_colors.dart';
import 'package:finance_app_michael/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the text theme from the app's theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      color: AppColors.card,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(transaction.imageUrl),
          radius: 20.r,
        ),
        title: Text(
          transaction.title,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          "${transaction.subtitle} · ${transaction.dateTime}",
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        trailing: Text(
          transaction.amount,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: transaction.isExpense ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
