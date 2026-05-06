import 'package:flutter/material.dart';

import '../../constants/app_text.dart';

class AuthFlowPlaceholderScreen extends StatelessWidget {
  const AuthFlowPlaceholderScreen({super.key});

  static const String routeName = AppText.routeAuth;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Auth flow placeholder'),
        ),
      ),
    );
  }
}

