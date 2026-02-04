# 🔧 Troubleshooting Guide

## Android v1 Embedding Error

### Problem
```
Build failed due to use of deleted Android v1 embedding
```

### Solution
This has been fixed in the latest commit. The app now uses Android v2 embedding.

**What was changed:**
1. Created proper `MainActivity.kt` extending `FlutterActivity`
2. Updated `build.gradle` files
3. Updated `settings.gradle` for Flutter plugin
4. Added `gradle.properties` configuration
5. Updated Gradle wrapper to version 8.3

### If Issue Persists

1. **Clean the project:**
```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
```

2. **Delete build folders:**
```bash
rm -rf android/build
rm -rf android/app/build
rm -rf build
```

3. **Rebuild:**
```bash
flutter run
```

---

## Common Build Issues

### 1. Gradle Sync Failed

**Error:**
```
Could not resolve all dependencies
```

**Solution:**
```bash
cd android
./gradlew --refresh-dependencies
cd ..
flutter clean
flutter pub get
flutter run
```

### 2. Kotlin Version Mismatch

**Error:**
```
Kotlin version mismatch
```

**Solution:**
Ensure `android/build.gradle` has:
```gradle
ext.kotlin_version = '1.9.10'
```

### 3. SDK Version Issues

**Error:**
```
Failed to install the following Android SDK packages
```

**Solution:**
1. Open Android Studio
2. Tools → SDK Manager
3. Install:
   - Android SDK Platform 34
   - Android SDK Build-Tools 34.0.0
   - Android SDK Command-line Tools

### 4. Multidex Issue

**Error:**
```
Cannot fit requested classes in a single dex file
```

**Solution:**
Already enabled in `android/app/build.gradle`:
```gradle
defaultConfig {
    multiDexEnabled true
}
```

### 5. Permission Issues

**Error:**
```
Permission denied
```

**Solution:**
```bash
chmod +x android/gradlew
```

---

## iOS Build Issues

### 1. CocoaPods Error

**Error:**
```
CocoaPods not installed
```

**Solution:**
```bash
sudo gem install cocoapods
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
```

### 2. Signing Error

**Error:**
```
No signing certificate found
```

**Solution:**
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Signing & Capabilities tab
4. Select your team or create Apple ID

### 3. Deployment Target

**Error:**
```
Deployment target is older than required
```

**Solution:**
Update `ios/Podfile`:
```ruby
platform :ios, '12.0'
```

---

## Runtime Issues

### 1. API Connection Failed

**Symptoms:**
- Registration fails
- Network error messages

**Solutions:**

**A. Check API URL:**
```dart
// lib/services/api_service.dart
static const String baseUrl = 'https://your-actual-api-url.com';
```

**B. Enable Cleartext Traffic (Android):**
Already configured in `AndroidManifest.xml`:
```xml
android:usesCleartextTraffic="true"
```

**C. iOS ATS Settings:**
Add to `ios/Runner/Info.plist` if using HTTP:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

### 2. Location Not Working

**Symptoms:**
- GPS button does nothing
- Permission denied

**Solutions:**

**A. Check Permissions:**
- Android: Settings → Apps → Mukkadam Registration → Permissions → Location
- iOS: Settings → Mukkadam Registration → Location

**B. Enable Location Services:**
- Android: Settings → Location → On
- iOS: Settings → Privacy → Location Services → On

**C. Test on Physical Device:**
Location may not work properly on emulators.

### 3. Image Picker Not Working

**Symptoms:**
- Camera/Gallery buttons don't work
- Crash when selecting image

**Solutions:**

**A. Check Permissions:**
- Camera permission
- Storage/Media permission

**B. Test on Physical Device:**
Camera doesn't work on most emulators.

**C. Check File Size:**
Ensure images aren't too large (< 10MB recommended).

### 4. Form Validation Issues

**Symptoms:**
- Cannot submit form
- "Please fill required fields" message

**Solutions:**

**Required Fields Checklist:**
- ✅ Mukkadam Name
- ✅ Mobile Number (10 digits)
- ✅ Crew Size
- ✅ Max Crew Capacity
- ✅ Start Date
- ✅ End Date
- ✅ Latitude
- ✅ Longitude
- ✅ State & State Code
- ✅ District & District Code
- ✅ Taluka & Taluka Code
- ✅ Village & Village Code

---

## Debug Commands

### Check Flutter Version
```bash
flutter --version
```

### Check Connected Devices
```bash
flutter devices
```

### Run with Verbose Logging
```bash
flutter run --verbose
```

### Check App Logs (Android)
```bash
adb logcat | grep Flutter
```

### Analyze Project
```bash
flutter analyze
```

### Check Dependencies
```bash
flutter pub outdated
```

---

## Performance Issues

### 1. App is Slow

**Solutions:**
- Run in release mode: `flutter run --release`
- Profile the app: `flutter run --profile`
- Check for memory leaks

### 2. Build Takes Too Long

**Solutions:**
```bash
# Increase Gradle memory
# Edit android/gradle.properties
org.gradle.jvmargs=-Xmx4G

# Enable Gradle daemon
org.gradle.daemon=true
```

### 3. Hot Reload Not Working

**Solutions:**
- Press `R` for hot restart instead of `r`
- Check for syntax errors
- Restart the app completely

---

## Complete Reset Procedure

If nothing works, try this complete reset:

```bash
# 1. Clean everything
flutter clean
rm -rf build
rm -rf android/build
rm -rf android/app/build
rm -rf ios/Pods
rm -rf ios/Podfile.lock
rm -rf .dart_tool

# 2. Get dependencies
flutter pub get

# 3. Android setup
cd android
./gradlew clean
cd ..

# 4. iOS setup (macOS only)
cd ios
pod install
cd ..

# 5. Run app
flutter run
```

---

## Getting Help

### Before Reporting an Issue

1. **Run Flutter Doctor:**
```bash
flutter doctor -v
```

2. **Collect Information:**
   - Flutter version
   - Dart version
   - Device/Platform details
   - Complete error logs
   - Steps to reproduce

3. **Check Existing Issues:**
   - [GitHub Issues](https://github.com/Rajanabalakrishna/mukkadam_registration_app/issues)

### Create New Issue

Include:
```markdown
**Environment:**
- Flutter version: 
- Dart version: 
- Device: 
- OS: 

**Problem:**
[Description]

**Steps to Reproduce:**
1. 
2. 
3. 

**Error Logs:**
```
[Paste logs here]
```

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]
```

---

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter Community](https://flutter.dev/community)

---

**Last Updated:** February 4, 2026
