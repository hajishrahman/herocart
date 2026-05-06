import 'package:flutter/material.dart';

import 'constants/app_styles.dart';
import 'constants/app_text.dart';
import 'screens/auth/auth_flow_placeholder_screen.dart';

void main() {
  runApp(const HeroCartApp());
}

class HeroCartApp extends StatelessWidget {
  const HeroCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.appName,
      theme: AppTheme.light(),
      initialRoute: AuthFlowPlaceholderScreen.routeName,
      routes: {
        AuthFlowPlaceholderScreen.routeName: (_) => const AuthFlowPlaceholderScreen(),
      },
    );
  }
}
