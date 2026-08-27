import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'utils/app_theme.dart';
import 'constants/app_constants.dart';

void main() {
  runApp(const BeautyBlissApp());
}

class BeautyBlissApp extends StatelessWidget {
  const BeautyBlissApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}