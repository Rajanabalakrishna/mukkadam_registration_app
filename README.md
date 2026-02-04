# Mukkadam Registration App

<div align="center">
  <h3>A comprehensive Flutter application for registering Mukkadam (crew supervisors) with advanced features</h3>
  <p>
    <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"></a>
    <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"></a>
  </p>
</div>

## 📋 Overview

This Flutter application provides a comprehensive registration system for Mukkadam (agricultural crew supervisors) with features including:

- ✅ **Complete Registration Form** - Personal info, crew details, location, and rate cards
- 📍 **GPS Location Tracking** - Automatic location capture with permission handling
- 📸 **Document Upload** - Profile photo, Aadhar, PAN, bank proof, and location photos
- 🔔 **Notification Preferences** - WhatsApp, SMS, and call preferences
- 💰 **Rate Card Management** - Track various agricultural activity rates
- 🌐 **API Integration** - Direct integration with backend API

## 🚀 Features

### Personal Information
- Mukkadam name
- Mobile number validation (10 digits)
- Aadhar number (optional)
- PAN number (optional)
- Voter ID number (optional)

### Crew Management
- Current crew size
- Maximum crew capacity
- Alternative contact numbers (2)
- Work period (start and end dates)

### Location Services
- GPS-based location capture
- State, District, Taluka, Village details with codes
- Manual latitude/longitude entry
- Location photo capture

### Rate Card
Supports rates for multiple agricultural activities:
- Pruning (regular and April)
- Dipping (first, second, third)
- Thinning (bunch, finger, berry)
- Shoot tying
- Paper wrapping/removal
- Harvesting
- And more...

### Document Management
- Profile photo
- Aadhar card
- PAN card
- Bank proof
- Location capture

## 📱 Screenshots

*(Screenshots will be added here)*

## 🛠️ Installation

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / Xcode (for mobile deployment)
- Git

### Setup Instructions

1. **Clone the repository**
```bash
git clone https://github.com/Rajanabalakrishna/mukkadam_registration_app.git
cd mukkadam_registration_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure API Endpoint**

Edit `lib/services/api_service.dart` and update the base URL if needed:
```dart
static const String baseUrl = 'https://your-api-endpoint.com';
```

4. **Run the app**
```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For Web
flutter run -d chrome
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0                    # HTTP requests
  image_picker: ^1.0.7            # Image selection
  geolocator: ^11.0.0             # GPS location
  permission_handler: ^11.2.0     # Runtime permissions
  intl: ^0.19.0                   # Date formatting
  shared_preferences: ^2.2.2      # Local storage
```

## 🔑 Permissions

### Android (AndroidManifest.xml)
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

### iOS (Info.plist)
```xml
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to capture documents</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs photo library access to select images</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access to capture current location</string>
```

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/
│   └── mukkadam_model.dart       # Data model
├── screens/
│   └── registration_screen.dart  # Main registration form
├── services/
│   └── api_service.dart          # API integration
└── widgets/
    ├── form_section.dart         # Reusable form section widget
    └── image_picker_widget.dart  # Image picker component
```

## 🔌 API Integration

### Endpoint
```
POST https://furtive-chrissy-reparably.ngrok-free.dev/api/mukkadam/
```

### Request Format
- **Content-Type**: `multipart/form-data`
- **Method**: POST

### Payload Structure

The app sends all form data as multipart form data including:
- Text fields (all registration data)
- File uploads (images)

### Response Handling
- **Success**: Status code 200-299
- **Error**: Exception thrown with error message

## 🎨 UI Components

### Form Sections
The app uses a modular design with reusable `FormSection` widgets:
- Personal Information
- Crew Information
- Location Details
- Preferences
- Rate Card
- Documents

### Image Picker Widget
Custom widget supporting:
- Gallery selection
- Camera capture
- Image preview
- Multiple document types

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📝 Form Validation

Required fields:
- Mukkadam name
- Mobile number (10 digits)
- Crew size
- Maximum crew capacity
- Start date
- End date
- Location details (latitude, longitude, state, district, taluka, village with codes)

Optional fields:
- All identity documents
- Alternative phone numbers
- Rate card entries
- Document uploads

## 🌍 Localization

Currently supports English. Future versions will include:
- Hindi
- Marathi
- Gujarati

## 🚧 Roadmap

- [ ] Offline mode with local data storage
- [ ] View registered Mukkadam list
- [ ] Edit existing registrations
- [ ] Search and filter functionality
- [ ] QR code generation for quick lookup
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Export data to Excel/PDF

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Rajana Balakrishna**
- GitHub: [@Rajanabalakrishna](https://github.com/Rajanabalakrishna)
- Email: rajanayaswanth152414@gmail.com
- Location: Srikakulam, India

## 📞 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Contact via email

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors to all the open-source packages used
- Agricultural community for domain knowledge

## 📊 Version History

### v1.0.0 (Current)
- Initial release
- Complete registration form
- GPS integration
- Image upload support
- API integration

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you find it helpful!</p>
</div>
