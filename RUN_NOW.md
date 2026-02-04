# 🚀 RUN THE APP NOW - Copy & Paste Commands

## 🔴 Option 1: Quick Run (Automatic Setup)

Copy and paste these commands one by one:

```bash
# 1. Clone repository
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app

# 2. Get dependencies
flutter pub get

# 3. Clean build (optional but recommended)
flutter clean

# 4. Auto-generate Android local.properties
rm -f android/local.properties
flutter build apk --debug

# 5. Run the app
flutter run
```

**That's it!** 🎉 The app should now be running!

---

## 🟡 Option 2: Manual Setup (If Option 1 Fails)

### Step 1: Clone and Install

```bash
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app
flutter pub get
```

### Step 2: Fix Android Gradle Permissions

```bash
chmod +x android/gradlew
```

### Step 3: Update local.properties

**Find your paths:**
```bash
# Flutter path
which flutter
# Copy the path WITHOUT /bin/flutter at the end

# Android SDK path - Usually one of these:
# Mac: ~/Library/Android/sdk
# Linux: ~/Android/Sdk  
# Windows: C:\Users\YourName\AppData\Local\Android\sdk
```

**Edit android/local.properties:**
```bash
nano android/local.properties
```

**Replace with your actual paths:**
```properties
sdk.dir=/Users/YOUR_USERNAME/Library/Android/sdk
flutter.sdk=/Users/YOUR_USERNAME/flutter
```

Press `Ctrl+X`, then `Y`, then `Enter` to save.

### Step 4: Clean and Build

```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
```

### Step 5: Run!

```bash
flutter run
```

---

## 🟢 Option 3: iOS Setup (Mac Only)

```bash
# 1. Clone and install
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app
flutter pub get

# 2. Install iOS dependencies
cd ios
pod install
cd ..

# 3. Run on iOS
flutter run -d ios
```

---

## ⚠️ Before Running - Device Setup

### For Android:

**Option A - Emulator:**
1. Open Android Studio
2. Click "More Actions" → "Virtual Device Manager"
3. Click "Create Device" or select existing device
4. Click the green play button to start emulator
5. Wait for emulator to fully boot
6. Run: `flutter run`

**Option B - Physical Device:**
1. Enable "Developer Options" on your Android phone:
   - Settings → About Phone → Tap "Build Number" 7 times
2. Enable "USB Debugging":
   - Settings → Developer Options → USB Debugging ON
3. Connect phone to computer via USB
4. Allow USB debugging when prompted on phone
5. Run: `flutter devices` (should show your device)
6. Run: `flutter run`

### For iOS (Mac only):

**Option A - Simulator:**
1. Open Xcode
2. Xcode → Open Developer Tool → Simulator
3. Choose a device (iPhone 14 recommended)
4. Wait for simulator to start
5. Run: `flutter run`

**Option B - Physical Device:**
1. Connect iPhone/iPad via USB
2. Trust computer on iOS device
3. Open `ios/Runner.xcworkspace` in Xcode
4. Select your device in Xcode
5. Sign the app (Xcode will guide you)
6. Run: `flutter run`

---

## 🔍 Check Everything is Ready

```bash
# Check Flutter installation
flutter doctor -v

# Check connected devices  
flutter devices

# List available devices should show:
# - Android emulator/device, OR
# - iOS simulator/device, OR  
# - Chrome (for web testing)
```

**Expected output:**
```
2 connected devices:

Android SDK built for x86 (mobile) • emulator-5554 • android-x86 • Android 13 (API 33)
Chrome (web)                       • chrome        • web-javascript • Google Chrome 120
```

---

## 🎯 Run Commands Reference

```bash
# Run in debug mode (default)
flutter run

# Run in release mode (faster, for testing)
flutter run --release

# Run on specific device
flutter run -d emulator-5554
flutter run -d chrome

# Run with verbose output (for debugging)
flutter run --verbose

# Build APK (Android)
flutter build apk --debug
flutter build apk --release

# Install APK to connected device
flutter install
```

---

## 🛑 If You See Errors

### Error: "No devices found"

**Solution:**
1. Start an emulator/simulator first
2. Or connect a physical device
3. Run `flutter devices` to verify
4. Then run `flutter run`

### Error: "Gradle build failed"

**Solution:**
```bash
flutter clean
cd android
./gradlew clean --refresh-dependencies
cd ..
flutter pub get
flutter run
```

### Error: "Android v1 embedding"

**Solution:**
```bash
rm -rf android/build
rm -rf android/app/build  
rm -rf build
flutter clean
flutter pub get
flutter run
```

### Error: "SDK location not found"

**Solution:**
Follow Option 2 (Manual Setup) above to set correct paths in `android/local.properties`

### Error: "Permission denied: ./gradlew"

**Solution:**
```bash
chmod +x android/gradlew
flutter run
```

### Error: "CocoaPods not installed" (iOS)

**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install  
cd ..
flutter run
```

---

## ✅ Success! App is Running

### What you should see:

1. **Terminal shows:**
```
Launching lib/main.dart on Android SDK built...
√ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app.apk...
```

2. **App opens on device/emulator**

3. **You see the Mukkadam Registration form**

### Hot Reload (during development):

- Press `r` in terminal - Hot reload (fast)
- Press `R` in terminal - Hot restart (full reload)
- Press `q` in terminal - Quit app

---

## 📱 Test the App

### Quick Test Flow:

1. **Fill Personal Info:**
   - Name: Test User
   - Mobile: 9876543210

2. **Fill Crew Info:**
   - Crew Size: 10
   - Max Capacity: 20
   - Select dates

3. **Location:**
   - Click "Get Current Location"
   - OR enter manually
   - Fill location details

4. **Submit:**
   - Click "Register Mukkadam"
   - Should see success message!

---

## 🔧 Development Commands

```bash
# Hot reload (press 'r' or save file)
r

# Hot restart (press 'R')  
R

# Show performance overlay (press 'p')
p

# Screenshot (press 's')
s

# Quit app (press 'q')
q
```

---

## 📦 Build for Production

### Android Release APK:

```bash
flutter build apk --release

# APK location:
# build/app/outputs/flutter-apk/app-release.apk

# Install on device:
adb install build/app/outputs/flutter-apk/app-release.apk
```

### iOS Release (Mac only):

```bash
flutter build ios --release

# Then open in Xcode:
open ios/Runner.xcworkspace

# Archive and distribute from Xcode
```

---

## 📊 Performance Tips

```bash
# Run in profile mode (check performance)
flutter run --profile

# Analyze code
flutter analyze

# Run tests
flutter test

# Check dependencies
flutter pub outdated
```

---

## 🔗 Need More Help?

- **Quick Start:** [QUICK_START.md](QUICK_START.md)
- **Full Setup:** [SETUP_GUIDE.md](SETUP_GUIDE.md)  
- **Troubleshooting:** [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- **GitHub Issues:** [Report a bug](https://github.com/Rajanabalakrishna/mukkadam_registration_app/issues)

---

## 📧 Contact

**Developer:** Rajana Balakrishna  
**Email:** rajanayaswanth152414@gmail.com  
**GitHub:** [@Rajanabalakrishna](https://github.com/Rajanabalakrishna)

---

**🎉 Congratulations! Your app should be running now!**

If you see the registration form on your device/emulator, you're all set! 🚀
