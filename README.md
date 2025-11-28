# Ready Flutter Template

A minimal, ready-to-deploy Flutter starter template. Clone, run `flutter pub get`, and you're ready to `flutter run`, `flutter test`, and build for Android or Web. (간단한 설명: 바로 실행·배포 가능한 Flutter 템플릿입니다.)

## Requirements
- Flutter SDK (latest stable, with FVM or direct install)
- Git
- Android toolchain (SDK, emulator/device). On Windows ensure Android Studio or the command-line tools are installed and added to PATH.
- For iOS builds, use macOS with Xcode (structure is ready; builds should be run on macOS).

## Project Structure
```
lib/
  main.dart                 # Entry point wiring the app config
  src/
    app.dart                # App widget and theme
    config/app_config.dart  # Simple environment config
    presentation/home/      # UI screens/widgets
    domain/utils/           # Pure Dart helpers (unit-test friendly)
    data/                   # Placeholder for repositories/data sources
```

## Quick Start
```bash
# Clone the repository
 git clone <your-repo-url> ready-flutter-template
 cd ready-flutter-template

 # Install dependencies
 flutter pub get

 # Run in debug (connect a device/emulator first)
 flutter run
```

## Environment configuration
- Copy `.env.example` to `.env` and set values as needed.
- Pass values to Flutter with `--dart-define`, e.g.:
  ```bash
  flutter run --dart-define APP_ENV=dev
  flutter build apk --dart-define APP_ENV=prod
  ```
- `APP_ENV` maps to `AppEnvironment` in `lib/src/config/app_config.dart`.

## Testing
```bash
flutter test
```

## Build commands
- Android APK (release):
  ```bash
  flutter build apk --release --dart-define APP_ENV=prod
  ```
- Android App Bundle (Play Store):
  ```bash
  flutter build appbundle --release --dart-define APP_ENV=prod
  ```
- Web release:
  ```bash
  flutter build web --release --dart-define APP_ENV=prod
  ```

## GitHub Actions CI
See `.github/workflows/flutter-ci.yml` for the CI pipeline. It installs Flutter, runs `flutter pub get`, `flutter test`, builds an Android APK and Web release, and uploads the artifacts for download.

## Reusing this template
- Update the package name/app name in `pubspec.yaml` and Android/iOS project settings if desired.
- Replace the home screen content under `lib/src/presentation/home/`.
- Add your own data sources to `lib/src/data/` and domain logic under `lib/src/domain/`.
- Update icons, splash screens, and app identifiers per platform as needed.
