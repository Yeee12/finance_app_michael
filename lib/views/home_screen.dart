import 'package:finance_app_michael/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/action_button.dart';
import '../../widgets/upcoming_payment_item.dart';
import '../../views/transaction_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,  // Using AppColors for background color
      appBar: AppBar(
        backgroundColor: AppColors.background,  // AppBar background color
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning",
              style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary), // AppColors for text color
            ),
            Text(
              "Phillip Press",
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: AppColors.primary), // Primary color for icon
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Container(
                width: 500.w,
                height: 390.h,
                // padding: EdgeInsets.all(16.w),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12.r),
                //   color: AppColors.card,  // Card color from AppColors
                //   boxShadow: [
                //     BoxShadow(
                //       color: AppColors.shadow,  // Shadow color from AppColors
                //       blurRadius: 5,
                //       spreadRadius: 1,
                //     ),
                //   ],
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/card.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(0.2)),
                      ),
                      Positioned(
                        top: 16.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total balance",
                              style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.background),
                            ),
                            Container(
                              width: 130.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: AppColors.background, // Slight opacity for primary color
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: viewModel.accountType,
                                    dropdownColor: Colors.white, // Set the dropdown background color to white
                                    icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    items: ["Main account", "Savings"].map(
                                          (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: TextStyle(color: Colors.black), // Set the text color to black
                                        ),
                                      ),
                                    ).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        viewModel.changeAccountType(value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                        top: 225.h,
                        left: 16.w,
                        right: 16.w,
                        child: Text(
                          "\$${viewModel.formattedBalance}",
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: AppColors.background,  // Primary color for total balance
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 290.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              viewModel.isAccountNumberVisible
                                  ? viewModel.accountNumber // Show full account number
                                  : "**** **** ${viewModel.accountNumber.substring(viewModel.accountNumber.length - 4)}", // Show masked format
                              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.background),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 243.h,
                          left: 16.w,
                          right: 16.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              viewModel.isAccountNumberVisible ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.background,
                            ),
                            onPressed: viewModel.toggleAccountNumberVisibility,
                          ),
                        ],
                      )
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActionButton(label: "Receive", icon: Icons.add_card, onTap: () {}),
                            ActionButton(label: "Send", icon: Icons.credit_card_rounded, onTap: () {}),
                            ActionButton(
                              label: "",
                              icon: Icons.more_horiz,
                              isCircular: true,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TransactionHistoryScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming payments",
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {}, // Add functionality for "View All"
                    child: Text("View all", style: theme.textTheme.bodySmall?.copyWith(color: AppColors.blueText)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: viewModel.upcomingPayments.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return UpcomingPaymentItem(payment: viewModel.upcomingPayments[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
