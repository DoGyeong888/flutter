# Ready Flutter Template (한글 가이드)

즉시 실행·배포할 수 있도록 구성된 Flutter 스타터 템플릿입니다. 저장소를 클론한 뒤 `flutter pub get`만 실행하면 바로 `flutter run`, `flutter test`, `flutter build` 명령을 사용할 수 있습니다.

## 요구 사항
- Flutter SDK (최신 stable 버전)
- Git
- Android 개발 도구: Android Studio 또는 CLI 도구 + 에뮬레이터/실디바이스 (Windows에서 PATH 설정 필요)
- iOS 빌드: macOS + Xcode (구조는 준비되어 있지만 실제 빌드는 macOS에서 수행)

## 프로젝트 구조
```
lib/
  main.dart                 # 진입점: 환경 변수를 읽어 앱 설정 적용
  src/
    app.dart                # 공통 테마와 MaterialApp 구성
    config/app_config.dart  # dev/prod 등 환경 설정
    presentation/home/      # UI 화면 및 위젯
    domain/utils/           # 순수 Dart 유틸(단위 테스트용 예제 포함)
    data/                   # 데이터 소스/리포지토리 자리(템플릿용)
```

## 시작하기
```bash
# 저장소 클론
 git clone <your-repo-url> ready-flutter-template
 cd ready-flutter-template

# 의존성 설치
 flutter pub get

# 디버그 실행 (기기/에뮬레이터 연결 필요)
 flutter run --dart-define APP_ENV=dev
```

## 환경 설정
- `.env.example`를 복사해 `.env`를 만들고 필요한 값을 채웁니다. 실제 `.env`는 커밋하지 않도록 `.gitignore`에 포함되어 있습니다.
- 주요 환경 변수 전달 예시:
  ```bash
  flutter run --dart-define APP_ENV=dev
  flutter build apk --dart-define APP_ENV=prod
  ```
- `APP_ENV`는 `lib/src/config/app_config.dart`의 `AppEnvironment`에 매핑되어 테마/텍스트 등에서 확인할 수 있습니다.

## 테스트
```bash
flutter test
```

## 빌드 명령어
- Android APK (릴리스)
  ```bash
  flutter build apk --release --dart-define APP_ENV=prod
  ```
- Android App Bundle (Play Store)
  ```bash
  flutter build appbundle --release --dart-define APP_ENV=prod
  ```
- Web (릴리스)
  ```bash
  flutter build web --release --dart-define APP_ENV=prod
  ```

## GitHub Actions CI
- `.github/workflows/flutter-ci.yml`에서 동작을 확인할 수 있습니다.
- 주요 단계: 저장소 체크아웃 → Flutter SDK 설정 → `flutter pub get` → `flutter test` → Android APK/Web 릴리스 빌드 → 빌드 산출물 아티팩트 업로드.
- 각 단계에 주석이 있어 무엇을 하는지 한눈에 확인할 수 있습니다.

## 템플릿 재사용 가이드
- `pubspec.yaml`의 앱 이름/설명을 프로젝트에 맞게 수정하세요.
- Android/iOS 패키지 이름, 앱 아이콘, 스플래시 등을 플랫폼별로 업데이트하세요.
- 홈 화면(`lib/src/presentation/home/`)과 도메인/데이터 레이어(`lib/src/domain`, `lib/src/data`)에 자신의 로직과 UI를 추가하세요.
- CI 빌드 대상(예: iOS 추가)이 필요하면 워크플로 YAML에 단계를 확장할 수 있습니다.

## Windows 참고
- PowerShell에서 Android SDK 경로가 PATH에 포함되어 있는지 확인하세요.
- `flutter doctor`로 환경을 점검하고 기기/에뮬레이터를 먼저 준비한 뒤 명령을 실행하면 설치 문제가 줄어듭니다.
