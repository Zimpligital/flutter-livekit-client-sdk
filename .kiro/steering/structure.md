# Project Structure

## Root Directory Layout
```
├── lib/                    # Main library source code
├── example/                # Example Flutter application
├── android/                # Android platform-specific code
├── ios/                    # iOS platform-specific code
├── macos/                  # macOS platform-specific code
├── windows/                # Windows platform-specific code
├── linux/                  # Linux platform-specific code
├── web/                    # Web platform files (E2EE workers)
├── shared_cpp/             # Shared C++ code for audio processing
├── shared_swift/           # Shared Swift code for iOS/macOS
├── test/                   # Unit and integration tests
└── scripts/                # Build and utility scripts
```

## Library Structure (`lib/src/`)
```
├── core/                   # Core SDK functionality (Room, Engine, SignalClient)
├── participant/            # Participant management (Local, Remote)
├── track/                  # Media track handling (Audio, Video, Local, Remote)
├── publication/            # Track publication management
├── e2ee/                   # End-to-end encryption
├── hardware/               # Hardware abstraction layer
├── managers/               # Event and broadcast managers
├── support/                # Platform abstractions and utilities
├── widgets/                # Flutter UI components
├── types/                  # Type definitions and data structures
├── proto/                  # Generated protobuf files
└── data_stream/            # Data streaming utilities
```

## Key Architecture Patterns

### Event-Driven Architecture
- Uses `EventsListener<Event>` pattern for specific events
- `ChangeNotifier` for generic UI state updates
- Events defined in `src/events.dart`

### Platform Abstraction
- Platform-specific implementations in `support/platform/`
- Conditional imports: `native.dart` vs `web.dart`
- WebSocket abstraction in `support/websocket/`

### Track Management
- Hierarchical structure: `Track` → `TrackPublication` → `Participant`
- Local vs Remote track implementations
- Audio/Video track specializations

### Widget Integration
- `VideoTrackRenderer` for video display
- `ScreenSelectDialog` for desktop screen sharing
- Flutter-specific UI components in `widgets/`

## File Naming Conventions
- Snake_case for file names
- Descriptive names matching class functionality
- Platform suffixes: `_native.dart`, `_web.dart`
- Test files: `*_test.dart`

## Import Organization
- External packages first
- Flutter framework imports
- Internal relative imports
- Configured via `import_sorter` package