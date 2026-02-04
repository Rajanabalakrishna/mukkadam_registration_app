class AppConstants {
  // API Configuration
  static const String apiBaseUrl = 'https://furtive-chrissy-reparably.ngrok-free.dev';
  static const String apiEndpoint = '/api/mukkadam/';
  
  // App Information
  static const String appName = 'Mukkadam Registration';
  static const String appVersion = '1.0.0';
  
  // Validation Constants
  static const int mobileNumberLength = 10;
  static const int aadharNumberLength = 12;
  static const int panNumberLength = 10;
  
  // Transport Modes
  static const List<Map<String, String>> transportModes = [
    {'value': 'no_vehicle', 'label': 'No Vehicle'},
    {'value': 'bike', 'label': 'Bike'},
    {'value': 'car', 'label': 'Car'},
    {'value': 'bus', 'label': 'Bus'},
    {'value': 'tempo', 'label': 'Tempo'},
    {'value': 'tractor', 'label': 'Tractor'},
  ];
  
  // Rate Card Activities
  static const List<String> pruningActivities = [
    'Pruning',
    'April Pruning',
    'Pasting',
    'Fail Fut Removal',
    'First Fail Fut Removal',
    'Second Fail Fut Removal',
    'Bagal Bali Fut Removal',
  ];
  
  static const List<String> dippingActivities = [
    'First Dipping',
    'Second Dipping',
    'Third Dipping',
  ];
  
  static const List<String> thinningActivities = [
    'Bunch Thinning',
    'Finger Thinning',
    'Berry Thinning',
  ];
  
  static const List<String> otherActivities = [
    'Shoot Tying',
    'Shoot Tying with Clips',
    'Shoot Tying with Strings',
    'Bunch Selection',
    'Bunch Tying',
    'Paper Wrapping',
    'Paper Removal',
    'Harvesting',
    'New Plantation',
    'Shenda Topping',
  ];
  
  // Success Messages
  static const String registrationSuccessMessage = 'Mukkadam registered successfully!';
  static const String locationCapturedMessage = 'Location captured successfully!';
  static const String imageCapturedMessage = 'Image captured successfully!';
  
  // Error Messages
  static const String networkErrorMessage = 'Network error. Please check your connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String validationErrorMessage = 'Please fill all required fields.';
  static const String locationErrorMessage = 'Unable to get location. Please enable GPS.';
  static const String cameraErrorMessage = 'Unable to access camera.';
  
  // Field Labels
  static const String requiredFieldIndicator = ' *';
}
