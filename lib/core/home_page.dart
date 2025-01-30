import 'package:finance_app_michael/views/expenses_screen.dart';
import 'package:finance_app_michael/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/bottom_nav_view_model.dart';
import 'bottom_nav_bar.dart';
class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    const HomeScreen(),
    ExpensesScreen(),
    const Center(child: Text("")),
    const Center(child: Text("Card")),
    const Center(child: Text("Account")),
  ];

  @override
  Widget build(BuildContext context) {
    final navViewModel = Provider.of<BottomNavViewModel>(context);

    return Scaffold(
      body: pages[navViewModel.selectedIndex], // Displays active page
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
