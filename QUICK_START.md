# ⚡ Quick Start Guide - Run in 5 Minutes!

## 🚨 Prerequisites Check

Before starting, ensure you have:
- ✅ Flutter SDK installed
- ✅ Android Studio OR Xcode (for iOS)
- ✅ Git installed

**Quick Check:**
```bash
flutter doctor
```
All items should show checkmarks ✅

---

## 🚀 Step-by-Step Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Update Local Properties (Android Only)

**Option A - Automatic (Recommended):**
```bash
rm android/local.properties
flutter build apk --debug
```
This auto-generates the correct `local.properties` file.

**Option B - Manual:**
Edit `android/local.properties` and update paths:
```properties
sdk.dir=/path/to/your/Android/sdk
flutter.sdk=/path/to/your/flutter
```

**Find your SDK paths:**
```bash
# Flutter SDK path
which flutter
# Returns something like: /Users/username/flutter/bin/flutter
# Your flutter.sdk is: /Users/username/flutter

# Android SDK path (usually):
# Mac: /Users/username/Library/Android/sdk
# Windows: C:\Users\username\AppData\Local\Android\sdk
# Linux: /home/username/Android/Sdk
```

### Step 4: Configure API Endpoint

Edit `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://furtive-chrissy-reparably.ngrok-free.dev';
```

**Change to your actual API URL if different!**

### Step 5: iOS Setup (Mac only)

```bash
cd ios
pod install
cd ..
```

### Step 6: Run the App!

**For Android:**
```bash
flutter run
```

**For iOS:**
```bash
flutter run -d ios
```

**For Web:**
```bash
flutter run -d chrome
```

---

## 🔧 If You Get Errors

### Error: "Build failed due to Android v1 embedding"

**Solution:**
```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
flutter run
```

### Error: "Gradle sync failed"

**Solution:**
```bash
cd android
chmod +x gradlew
./gradlew clean
cd ..
flutter clean
flutter run
```

### Error: "No devices found"

**Android:**
1. Open Android Studio
2. Tools → AVD Manager
3. Create/Start an emulator
4. Run `flutter run` again

**iOS:**
1. Open Xcode
2. Window → Devices and Simulators
3. Select a simulator
4. Click the play button
5. Run `flutter run` again

### Error: "Permission denied"

```bash
chmod +x android/gradlew
flutter run
```

### Error: "CocoaPods not installed" (iOS)

```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
flutter run
```

---

## 📦 Build APK for Testing

**Debug APK (for testing):**
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk`

**Release APK (for distribution):**
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

**Install directly to device:**
```bash
flutter install
```

---

## 📱 Test the App

### 1. Personal Information
- Enter Mukkadam name
- Enter 10-digit mobile number
- Fill optional fields (Aadhar, PAN, Voter ID)

### 2. Crew Information
- Enter crew size and max capacity
- Select start and end dates
- Add alternative phone numbers (optional)

### 3. Location
- Click "Get Current Location" button
- OR manually enter latitude/longitude
- Fill state, district, taluka, village with codes

### 4. Preferences
- Toggle smartphone availability
- Select transport mode
- Choose notification preferences

### 5. Rate Card (Optional)
- Enter rates for various activities
- Leave blank if not applicable

### 6. Documents (Optional)
- Take/upload profile photo
- Upload Aadhar card
- Upload PAN card
- Upload bank proof
- Take location photo

### 7. Submit
- Click "Register Mukkadam" button
- Wait for success message
- Form resets automatically

---

## ⚙️ App Features to Test

### ✅ Must Test
1. **Form Validation**
   - Try submitting without required fields
   - Check mobile number validation (10 digits)

2. **GPS Location**
   - Grant location permission
   - Click "Get Current Location"
   - Verify latitude/longitude populated

3. **Date Picker**
   - Select start date
   - Select end date (must be after start date)

4. **Image Upload**
   - Test camera capture
   - Test gallery selection
   - Verify image preview

5. **API Submission**
   - Fill all required fields
   - Submit form
   - Check for success message

### 💡 Tips

- **Test on real device** for camera and GPS
- **Check API endpoint** is running and accessible
- **Grant all permissions** when prompted
- **Use dummy data** for testing (but valid format)

---

## 📊 Performance

**Hot Reload (during development):**
- Make code changes
- Press `r` in terminal
- See changes instantly!

**Hot Restart:**
- Press `R` in terminal
- Full app restart

**Debug Mode:**
```bash
flutter run
```

**Release Mode (better performance):**
```bash
flutter run --release
```

---

## 📝 Common Test Data

```
Mukkadam Name: Rajesh Kumar
Mobile: 9876543210
Crew Size: 15
Max Capacity: 25
State: Karnataka
State Code: KA
District: Bengaluru
District Code: 265
Taluka: Bengaluru North
Taluka Code: 2888
Village: Yelahanka
Village Code: 234567
```

---

## 🌐 Network Configuration

### For HTTP API (Development)

**Android** - Already configured in `AndroidManifest.xml`:
```xml
android:usesCleartextTraffic="true"
```

**iOS** - Add to `Info.plist` if needed:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

---

## ✅ Success Checklist

- [ ] Repository cloned
- [ ] Dependencies installed (`flutter pub get`)
- [ ] API endpoint configured
- [ ] Device/Emulator connected
- [ ] App running without errors
- [ ] Can navigate through all form sections
- [ ] Location permission granted
- [ ] Camera permission granted
- [ ] Form submits successfully

---

## 🔗 Quick Links

- [Full README](README.md)
- [Setup Guide](SETUP_GUIDE.md)
- [Troubleshooting](TROUBLESHOOTING.md)
- [GitHub Repository](https://github.com/Rajanabalakrishna/mukkadam_registration_app)

---

## 👨‍💻 Need Help?

1. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Run `flutter doctor -v` and share output
3. Open an issue on GitHub
4. Email: rajanayaswanth152414@gmail.com

---

**You're all set! 🎉**

The app should now be running on your device/emulator!
