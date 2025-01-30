import 'package:finance_app_michael/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../viewmodels/transaction_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = TransactionViewModel();
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Transaction history',
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Text(
            'Today',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.h),
          ...viewModel.getTodayTransactions().map((transaction) {
            return TransactionItem(transaction: transaction);
          }).toList(),
          SizedBox(height: 19.h),
          Text(
            'Yesterday',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.h),
          ...viewModel.getYesterdayTransactions().map((transaction) {
            return TransactionItem(transaction: transaction);
          }).toList(),
        ],
      ),
    );
  }
}
