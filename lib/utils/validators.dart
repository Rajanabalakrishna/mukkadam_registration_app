class Validators {
  // Mobile number validation (10 digits)
  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Mobile number must contain only digits';
    }
    return null;
  }

  // Aadhar number validation (12 digits)
  static String? validateAadhar(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }
    if (value.length != 12) {
      return 'Aadhar number must be 12 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Aadhar number must contain only digits';
    }
    return null;
  }

  // PAN number validation (10 characters)
  static String? validatePAN(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }
    if (value.length != 10) {
      return 'PAN number must be 10 characters';
    }
    if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value.toUpperCase())) {
      return 'Invalid PAN format (e.g., ABCDE1234F)';
    }
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Number validation
  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '$fieldName must be a number';
    }
    return null;
  }

  // Rate validation (optional)
  static String? validateRate(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional
    }
    if (!RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(value)) {
      return 'Please enter a valid rate';
    }
    return null;
  }

  // Location code validation
  static String? validateCode(String? value, String codeName) {
    if (value == null || value.isEmpty) {
      return '$codeName is required';
    }
    if (!RegExp(r'^[A-Z0-9]+$').hasMatch(value.toUpperCase())) {
      return 'Invalid $codeName format';
    }
    return null;
  }
}
