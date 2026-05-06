class Validators {
  const Validators._();

  static final RegExp _emailPattern = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  static String? email(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Email is required';
    }

    if (!_emailPattern.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? password(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final confirmation = value ?? '';

    if (confirmation.isEmpty) {
      return 'Confirm your password';
    }

    if (confirmation != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}

