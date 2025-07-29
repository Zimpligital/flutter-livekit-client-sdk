# Technology Stack

## Framework & Language
- **Flutter SDK**: Cross-platform mobile/desktop/web framework
- **Dart**: Primary programming language (SDK >=3.6.0 <4.0.0)
- **WebRTC**: Underlying real-time communication technology via `flutter_webrtc`

## Key Dependencies
- `flutter_webrtc: ^0.14.2` - WebRTC implementation for Flutter
- `dart_webrtc: ^1.5.3` - Dart WebRTC bindings
- `protobuf: ^4.1.0` - Protocol buffer support for LiveKit protocol
- `connectivity_plus: ^6.0.2` - Network connectivity detection
- `device_info_plus: ^11.3.0` - Device information access

## Platform Support
- **Mobile**: iOS (12.1+), Android
- **Desktop**: macOS, Windows, Linux
- **Web**: Browser support with WebRTC

## Build System & Commands

### Development Commands
```bash
# Install dependencies
flutter pub get

# Run example app
cd example && flutter run

# Format code
dart format .

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Build Commands
```bash
# Generate protobuf files (requires ../protocol/protobufs)
make proto

# Compile E2EE worker for web
make e2ee
# or manually:
dart compile js web/e2ee.worker.dart -o example/web/e2ee.worker.dart.js -m
```

### Platform-Specific Setup
- **iOS**: Requires camera/microphone permissions in Info.plist, minimum iOS 12.1
- **Android**: Requires multiple permissions in AndroidManifest.xml for camera, audio, network
- **Web**: Requires compiled E2EE worker for encryption support

## Code Quality Tools
- **Linter**: Uses `package:lints/recommended.yaml` with custom rules
- **Import Sorter**: Configured via `import_sorter` package
- **Analysis**: Strict type checking enabled, protobuf files excluded