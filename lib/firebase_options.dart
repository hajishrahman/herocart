import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  const DefaultFirebaseOptions._();

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('HeroCart Firebase is not configured for web.');
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        throw UnsupportedError('HeroCart Firebase is not configured for Apple platforms.');
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError('HeroCart Firebase is not configured for desktop platforms.');
      case TargetPlatform.fuchsia:
        throw UnsupportedError('HeroCart Firebase is not configured for fuchsia.');
    }
  }

  // Values sourced from `android/app/google-services.json`.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy4y4iNYC6NpSZc124zF-FMM4EWtU80L4',
    appId: '1:103874431862:android:369962464f62891f488857',
    messagingSenderId: '103874431862',
    projectId: 'herocart111h',
    storageBucket: 'herocart111h.firebasestorage.app',
  );
}

