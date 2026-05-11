# Study Deck Architecture

Study Deck uses Flutter for UI, Riverpod for state management, and Firebase (Auth + Firestore + Storage) as backend services.

## Layers

- **UI Layer (`lib/screens`, `lib/widgets`)**: feature screens and reusable components.
- **State Layer (`lib/providers`)**: Riverpod providers expose stream/future state to UI.
- **Service Layer (`lib/services`)**: Firebase CRUD and auth operations.
- **Model Layer (`lib/models`)**: typed entities with map conversion for Firestore.
- **Platform Layer (`ios/swift_modules`)**: native iOS extension points (calendar sync scaffold).
