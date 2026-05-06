import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'constants/app_styles.dart';
import 'constants/app_text.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const HeroCartApp());
}

class HeroCartApp extends StatelessWidget {
  const HeroCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppText.appName,
        theme: AppTheme.light(),
        home: const AuthWrapper(),
      ),
    );
  }
}
