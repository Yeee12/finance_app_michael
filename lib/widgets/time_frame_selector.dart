import 'package:flutter/material.dart';

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
        return GestureDetector(
          onTap: () => onSelectTimeFrame(timeFrame),
          child: Text(
            timeFrame,
            style: TextStyle(
              fontSize: 10,
              fontWeight: selectedTimeFrame == timeFrame ? FontWeight.bold : FontWeight.normal,
              color: selectedTimeFrame == timeFrame ? Colors.grey : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
