import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeFrameSelector extends StatelessWidget {
  final String selectedTimeFrame;
  final Function(String) onSelectTimeFrame;

  const TimeFrameSelector({
    Key? key,
    required this.selectedTimeFrame,
    required this.onSelectTimeFrame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['W', 'M', '3M', '6M', 'Y', 'All'].map((timeFrame) {
        final bool isSelected = selectedTimeFrame == timeFrame;

        return GestureDetector(
          onTap: () => onSelectTimeFrame(timeFrame),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.accent.withOpacity(0.5) : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              timeFrame,
              style: GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
