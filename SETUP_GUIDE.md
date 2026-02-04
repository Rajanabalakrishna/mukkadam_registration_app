# 🚀 Setup Guide - Mukkadam Registration App

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation Steps](#installation-steps)
3. [Configuration](#configuration)
4. [Running the App](#running-the-app)
5. [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Software

1. **Flutter SDK** (version 3.0.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH

2. **Git**
   - Download from: https://git-scm.com/downloads

3. **For Android Development:**
   - Android Studio (latest version)
   - Android SDK (API level 21 or higher)
   - Android Emulator or Physical Device

4. **For iOS Development (macOS only):**
   - Xcode (latest version)
   - CocoaPods: `sudo gem install cocoapods`
   - iOS Simulator or Physical Device

### Verify Installation

Run the following command to check your Flutter installation:

```bash
flutter doctor
```

Ensure all checkmarks are green before proceeding.

## Installation Steps

### Step 1: Clone the Repository

```bash
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

This will download all required packages listed in `pubspec.yaml`.

### Step 3: Verify Project Structure

Ensure the following structure exists:

```
mukkadam_registration_app/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── screens/
│   ├── services/
│   └── widgets/
├── pubspec.yaml
└── README.md
```

## Configuration

### API Endpoint Configuration

1. Open `lib/services/api_service.dart`

2. Update the base URL:

```dart
static const String baseUrl = 'https://your-api-endpoint.com';
```

**Current endpoint:**
```dart
static const String baseUrl = 'https://furtive-chrissy-reparably.ngrok-free.dev';
```

### Android Configuration

1. **Update AndroidManifest.xml** (already configured):
   - Location: `android/app/src/main/AndroidManifest.xml`
   - Permissions are pre-configured

2. **Update build.gradle** (already configured):
   - Location: `android/app/build.gradle`
   - Minimum SDK: 21
   - Target SDK: 34

3. **Optional - Change Package Name:**
   - Update `namespace` in `android/app/build.gradle`
   - Update `package` in `AndroidManifest.xml`

### iOS Configuration

1. **Update Info.plist** (already configured):
   - Location: `ios/Runner/Info.plist`
   - Permission descriptions are pre-configured

2. **Install iOS Pods:**

```bash
cd ios
pod install
cd ..
```

3. **Optional - Change Bundle Identifier:**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select Runner target
   - Update Bundle Identifier

## Running the App

### Check Available Devices

```bash
flutter devices
```

### Run on Android

**Using Emulator:**
1. Start Android Studio
2. Open AVD Manager
3. Launch an emulator
4. Run:

```bash
flutter run
```

**Using Physical Device:**
1. Enable USB Debugging on your Android device
2. Connect device via USB
3. Run:

```bash
flutter run
```

### Run on iOS (macOS only)

**Using Simulator:**
1. Open Xcode
2. Select a simulator from the device list
3. Run:

```bash
flutter run
```

**Using Physical Device:**
1. Connect iPhone/iPad
2. Trust the computer on device
3. Run:

```bash
flutter run
```

### Run on Web

```bash
flutter run -d chrome
```

### Build Release Version

**Android APK:**
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

**Android App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

**iOS (macOS only):**
```bash
flutter build ios --release
```

## Troubleshooting

### Common Issues

#### 1. "Gradle build failed"

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### 2. "CocoaPods not installed" (iOS)

**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
```

#### 3. "Permission denied" errors

**Solution:**
- Ensure all permissions are added to AndroidManifest.xml and Info.plist
- Request permissions at runtime (already implemented in the app)

#### 4. "API connection failed"

**Solution:**
- Verify API endpoint URL in `api_service.dart`
- Check internet connectivity
- Ensure backend server is running
- Check for CORS issues (web only)

#### 5. "Image picker not working"

**Solution:**
- Verify camera and storage permissions
- Test on physical device (camera may not work on emulator)
- Check iOS Info.plist has correct permission descriptions

#### 6. "Location not capturing"

**Solution:**
- Enable location services on device
- Grant location permission when prompted
- For iOS simulator: Debug → Location → Custom Location

### Debug Mode

Run in debug mode with verbose logging:

```bash
flutter run --verbose
```

### Check Logs

**Android:**
```bash
adb logcat
```

**iOS:**
```bash
open Console.app
```

### Clear Cache

If experiencing persistent issues:

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter run
```

## Testing

### Run Unit Tests

```bash
flutter test
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

## Performance Tips

1. **Enable Hot Reload:** Press `r` in terminal while app is running
2. **Hot Restart:** Press `R` for full restart
3. **Profile Mode:** Test performance with `flutter run --profile`
4. **Release Mode:** Always test final build with `flutter run --release`

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Package Documentation](https://pub.dev)

## Support

If you encounter issues not covered here:

1. Check the [GitHub Issues](https://github.com/Rajanabalakrishna/mukkadam_registration_app/issues)
2. Create a new issue with:
   - Flutter version (`flutter --version`)
   - Device/Platform details
   - Error logs
   - Steps to reproduce

---

**Happy Coding! 🚀**
