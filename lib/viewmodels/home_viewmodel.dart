import 'package:finance_app_michael/models/upcoming_payment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //import intl for number formatting

class HomeViewModel extends ChangeNotifier {
  double _totalBalance = 12902.72;
  String _accountType = "Main account";
  String _accountNumber = "1234 5654 3789";
  bool _isAccountNumberVisible = false; // Flag to toggle account number visibility

  final List<UpcomingPayment> _upcomingPayments = [
    UpcomingPayment(
      title: "Netflix",
      imagePath: "assets/images/netflix.png",
      amount: 16.56,
      dueDate: "Monthly, next on 09/12",
    ),
    UpcomingPayment(
      title: "Apple One",
      imagePath: "assets/images/apple.png",
      amount: 20.98,
      dueDate: "Monthly, next on 10/20",
    ),
  ];

  // Getters for private fields
  double get totalBalance => _totalBalance;
  String get accountType => _accountType;
  String get accountNumber => _accountNumber;
  bool get isAccountNumberVisible => _isAccountNumberVisible;

  // Getter for formatted balance
  String get formattedBalance {
    return NumberFormat('#,##0.00', 'en_US').format(_totalBalance);
  }

  // Return a copy of the list to maintain encapsulation
  List<UpcomingPayment> get upcomingPayments => List.unmodifiable(_upcomingPayments);

  // Change the account type and notify listeners
  void changeAccountType(String newAccount) {
    _accountType = newAccount;
    notifyListeners();
  }

  // Toggle the visibility of the account number
  void toggleAccountNumberVisibility() {
    _isAccountNumberVisible = !_isAccountNumberVisible;
    notifyListeners();
  }
}
