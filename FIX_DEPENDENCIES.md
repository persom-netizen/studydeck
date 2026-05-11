# Study Deck - Quick Fix Guide

## Issue
The error occurs because **dependencies haven't been downloaded yet**. The `pubspec.yaml` file lists the packages, but they need to be fetched from pub.dev.

## Solution

### Step 1: Get Flutter Dependencies
Run this command in your project root directory:

```bash
flutter pub get
```

This will download all required packages including:
- `flutter_riverpod` - State management
- `firebase_core` - Firebase initialization
- `firebase_auth` - Authentication
- `cloud_firestore` - Database
- `firebase_storage` - File storage

### Step 2: Verify Installation
```bash
flutter pub outdated
```

### Step 3: Clean Build (if issues persist)
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Step 4: Run the App
```bash
# For Chrome (Web)
flutter run -d chrome

# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

## Troubleshooting

### Windows-Specific Issues
If you're on Windows with XAMPP:
1. Make sure Flutter is properly installed: `flutter --version`
2. Check Dart version: `dart --version`
3. Run from PowerShell or CMD (not WSL)
4. Delete `pubspec.lock` if present and run `flutter pub get` again

### Firebase Web Support
For Chrome/Web, you may also need to enable web:
```bash
flutter config --enable-web
flutter create . --platforms web
```

### Still Having Issues?
1. **Restart IDE**: Close and reopen your IDE (VS Code, Android Studio)
2. **Invalidate cache**: In Flutter projects, sometimes the IDE cache gets stale
3. **Check package versions**: Run `flutter pub outdated` to see if any packages are incompatible

## Next Steps After Fixing Dependencies

1. Configure Firebase credentials for web/mobile
2. Set up iOS/Android platform-specific settings
3. Update Firebase configuration in `lib/config/firebase_config.dart`
4. Run `flutter run` to start development

---

**Updated `pubspec.yaml` has been committed to the repository with all necessary dependencies!**
