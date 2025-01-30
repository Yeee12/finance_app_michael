import 'package:finance_app_michael/core/home_page.dart';
import 'package:finance_app_michael/core/theme.dart';
import 'package:finance_app_michael/utils/routes.dart';
import 'package:finance_app_michael/viewmodels/bottom_nav_view_model.dart';
import 'package:finance_app_michael/viewmodels/expenses_viewmodel.dart';
import 'package:finance_app_michael/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ExpensesViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812), // Set your default design size (width x height)
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            onGenerateRoute: AppRoutes.generateRoute,
            theme: appTheme, // Apply your custom theme here
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
