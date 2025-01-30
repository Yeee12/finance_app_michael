import 'package:flutter/foundation.dart';

@immutable
class UpcomingPayment {
 final String title;
 final String imagePath;
 final double amount;
 final String dueDate;

 const UpcomingPayment({
  required this.title,
  required this.imagePath,
  required this.amount,
  required this.dueDate,
 });
}
