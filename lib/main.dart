import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants/app_styles.dart';
import 'constants/app_text.dart';
import 'firebase_options.dart';
import 'screens/auth/auth_flow_placeholder_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
