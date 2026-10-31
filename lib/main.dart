import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/login/login_screen.dart';
import 'screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.darkTheme,

      home: SplashScreen(
        onFinished: () {
          navigatorKey.currentState!.pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ),
    );
  }
}
