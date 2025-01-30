import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../viewmodels/bottom_nav_view_model.dart';
import '../core/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final List<Map<String, dynamic>> _navItems = [
    {'icon':  CupertinoIcons.shield_fill, 'label': 'Home'},
    {'icon': CupertinoIcons.chart_bar_square, 'label': 'Insight'},
    {'icon': CupertinoIcons.barcode_viewfinder, 'label': ''},
    {'icon': CupertinoIcons.creditcard, 'label': 'Cards'},
    {'icon': CupertinoIcons.profile_circled, 'label': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    final navViewModel = Provider.of<BottomNavViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_navItems.length, (index) {
          final bool isSelected = navViewModel.selectedIndex == index;
          final iconData = _navItems[index]['icon'];
          final label = _navItems[index]['label'];

          if (index == 2) {
            // Center floating action button (Scan)
            return GestureDetector(
              onTap: () => navViewModel.updateIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      iconData,
                      size: 28.sp,
                      color: AppColors.background,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          // Regular icon with text
          return GestureDetector(
            onTap: () => navViewModel.updateIndex(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size: 26.sp,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
