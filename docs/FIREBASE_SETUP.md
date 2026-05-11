# Firebase Setup

Study Deck expects Firebase to be configured for each target platform.

## 1) Install dependencies

```bash
flutter pub get
```

## 2) Configure with FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

This generates platform Firebase config and registers your app IDs.

## 3) Web runtime configuration

For web, `lib/config/firebase_config.dart` reads required values from Dart defines:

- `FIREBASE_API_KEY`
- `FIREBASE_APP_ID`
- `FIREBASE_MESSAGING_SENDER_ID`
- `FIREBASE_PROJECT_ID`

Optional:

- `FIREBASE_AUTH_DOMAIN`
- `FIREBASE_STORAGE_BUCKET`
- `FIREBASE_MEASUREMENT_ID`

Example:

```bash
flutter run -d chrome \
  --dart-define=FIREBASE_API_KEY=... \
  --dart-define=FIREBASE_APP_ID=... \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=... \
  --dart-define=FIREBASE_PROJECT_ID=... \
  --dart-define=FIREBASE_AUTH_DOMAIN=... \
  --dart-define=FIREBASE_STORAGE_BUCKET=...
```

## 4) Platform files

- Android: `android/app/google-services.json`
- iOS/macOS: `ios/Runner/GoogleService-Info.plist` (and macOS if used)

These files should not be hardcoded into source control for shared/public repos.
