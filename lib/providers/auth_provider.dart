import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';

import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({AuthService? authService})
    : _authService = authService ?? AuthService();

  final AuthService _authService;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  fb.User? get currentUser => _authService.currentUser;
  Stream<fb.User?> get authStateChanges => _authService.authStateChanges();

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
  }) {
    return _runAuthAction(
      () => _authService.signUpWithEmail(email: email, password: password),
    );
  }

  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _runAuthAction(
      () => _authService.signInWithEmail(email: email, password: password),
    );
  }

  Future<bool> signInWithGoogle() {
    return _runAuthAction(_authService.signInWithGoogle);
  }

  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
      _errorMessage = null;
    } catch (error) {
      _errorMessage = _friendlyError(error);
    } finally {
      _setLoading(false);
    }
  }

  void clearError() {
    if (_errorMessage == null) {
      return;
    }

    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> _runAuthAction(Future<Object?> Function() action) async {
    _setLoading(true);
    try {
      await action();
      _errorMessage = null;
      return true;
    } catch (error) {
      _errorMessage = _friendlyError(error);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _friendlyError(Object error) {
    if (error is fb.FirebaseAuthException) {
      return switch (error.code) {
        'email-already-in-use' => 'This email is already registered',
        'invalid-email' => 'Enter a valid email address',
        'user-disabled' => 'This account has been disabled',
        'user-not-found' || 'wrong-password' || 'invalid-credential' =>
          'Invalid email or password',
        'weak-password' => 'Choose a stronger password',
        'network-request-failed' => 'Check your internet connection',
        _ => error.message ?? 'Authentication failed',
      };
    }

    return 'Authentication failed. Please try again.';
  }
}
