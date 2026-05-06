import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_styles.dart';
import '../../providers/auth_provider.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();

    return StreamBuilder<fb.User?>(
      stream: authProvider.authStateChanges,
      initialData: authProvider.currentUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const LoginScreen();
        }

        return _AuthenticatedScreen(user: user);
      },
    );
  }
}

class _AuthenticatedScreen extends StatelessWidget {
  const _AuthenticatedScreen({required this.user});

  final fb.User user;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('HeroCart')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        user.email ?? user.displayName ?? 'Signed in user',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Authentication is ready. Product, cart, and payment features will be added in later phases.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: authProvider.isLoading
                    ? null
                    : () => context.read<AuthProvider>().signOut(),
                icon: authProvider.isLoading
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
