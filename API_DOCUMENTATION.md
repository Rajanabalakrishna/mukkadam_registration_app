# 🌐 API Documentation

## Overview

This document describes the API integration for the Mukkadam Registration App.

## Base Configuration

**Current Endpoint:**
```
POST https://furtive-chrissy-reparably.ngrok-free.dev/api/mukkadam/
```

**Configuration File:** `lib/services/api_service.dart`

```dart
static const String baseUrl = 'https://furtive-chrissy-reparably.ngrok-free.dev';
static const String apiEndpoint = '/api/mukkadam/';
```

---

## API Request

### Method
```
POST
```

### Content-Type
```
multipart/form-data
```

### Headers
```json
{
  "Content-Type": "multipart/form-data",
  "Accept": "application/json"
}
```

---

## Request Payload

### Text Fields

#### Personal Information
| Field Name | Type | Required | Description |
|------------|------|----------|-------------|
| `mukkadam_name` | string | Yes | Full name of Mukkadam |
| `mobile_numbers` | string | Yes | Primary mobile number (10 digits) |
| `aadhar_number` | string | No | Aadhar card number (12 digits) |
| `pan_number` | string | No | PAN card number (10 characters) |
| `voter_id_number` | string | No | Voter ID number |

#### Crew Information
| Field Name | Type | Required | Description |
|------------|------|----------|-------------|
| `crew_size` | string | Yes | Current crew size (number) |
| `max_crew_capacity` | string | Yes | Maximum crew capacity (number) |
| `alt_phone_1` | string | No | Alternative phone number 1 |
| `alt_phone_2` | string | No | Alternative phone number 2 |
| `start_date` | string | Yes | Start date (YYYY-MM-DD format) |
| `end_date` | string | Yes | End date (YYYY-MM-DD format) |

#### Location Details
| Field Name | Type | Required | Description |
|------------|------|----------|-------------|
| `latitude` | string | Yes | GPS latitude |
| `longitude` | string | Yes | GPS longitude |
| `state` | string | Yes | State name |
| `state_code` | string | Yes | State code |
| `district` | string | Yes | District name |
| `district_code` | string | Yes | District code |
| `taluka` | string | Yes | Taluka name |
| `taluka_code` | string | Yes | Taluka code |
| `village` | string | Yes | Village name |
| `village_code` | string | Yes | Village code |

#### Preferences
| Field Name | Type | Required | Description |
|------------|------|----------|-------------|
| `smartphone_availability` | boolean | Yes | Has smartphone (true/false) |
| `is_permanent` | boolean | Yes | Permanent position (true/false) |
| `transport_mode` | string | Yes | no_vehicle, bike, car, bus, tempo, tractor |
| `whatsapp_notification` | boolean | Yes | WhatsApp notifications enabled |
| `sms_notification` | boolean | Yes | SMS notifications enabled |
| `call_notification` | boolean | Yes | Call notifications enabled |

#### Rate Card (All Optional)
| Field Name | Type | Required | Description |
|------------|------|----------|-------------|
| `pruning` | string | No | Pruning rate |
| `april_pruning` | string | No | April pruning rate |
| `pasting` | string | No | Pasting rate |
| `fail_fut_removal` | string | No | Fail fut removal rate |
| `first_fail_fut_removal` | string | No | First fail fut removal rate |
| `second_fail_fut_removal` | string | No | Second fail fut removal rate |
| `bagal_bali_fut_removal` | string | No | Bagal bali fut removal rate |
| `first_dipping` | string | No | First dipping rate |
| `second_dipping` | string | No | Second dipping rate |
| `third_dipping` | string | No | Third dipping rate |
| `shoot_tying` | string | No | Shoot tying rate |
| `shoot_tying_clips` | string | No | Shoot tying with clips rate |
| `shoot_tying_strings` | string | No | Shoot tying with strings rate |
| `bunch_thinning` | string | No | Bunch thinning rate |
| `finger_thinning` | string | No | Finger thinning rate |
| `berry_thinning` | string | No | Berry thinning rate |
| `bunch_selection` | string | No | Bunch selection rate |
| `bunch_tying` | string | No | Bunch tying rate |
| `bunch_variation` | string | No | Bunch variation rate |
| `shenda_topping` | string | No | Shenda topping rate |
| `paper_wrapping` | string | No | Paper wrapping rate |
| `paper_removal` | string | No | Paper removal rate |
| `harvesting` | string | No | Harvesting rate |
| `new_plantation` | string | No | New plantation rate |
| `default_rate` | string | No | Default rate |
| `other_rate` | string | No | Other rate |

### File Uploads (All Optional)

| Field Name | Type | Description |
|------------|------|-------------|
| `profilePhotoPath` | File | Profile photo (JPG/PNG) |
| `aadharCardPath` | File | Aadhar card image |
| `panCardPath` | File | PAN card image |
| `bankProofPath` | File | Bank proof document |
| `locationCapturePath` | File | Location photo |

---

## Example Request

### cURL Example

```bash
curl -X POST 'https://furtive-chrissy-reparably.ngrok-free.dev/api/mukkadam/' \
  -H 'Content-Type: multipart/form-data' \
  -F 'mukkadam_name=Rajesh Kumar' \
  -F 'mobile_numbers=9876543210' \
  -F 'crew_size=15' \
  -F 'max_crew_capacity=25' \
  -F 'start_date=2026-02-20' \
  -F 'end_date=2026-03-20' \
  -F 'latitude=12.9716' \
  -F 'longitude=77.5946' \
  -F 'state=Karnataka' \
  -F 'state_code=KA' \
  -F 'district=Bengaluru' \
  -F 'district_code=265' \
  -F 'taluka=Bengaluru North' \
  -F 'taluka_code=2888' \
  -F 'village=Yelahanka' \
  -F 'village_code=234567' \
  -F 'smartphone_availability=true' \
  -F 'is_permanent=false' \
  -F 'transport_mode=bike' \
  -F 'whatsapp_notification=true' \
  -F 'sms_notification=true' \
  -F 'call_notification=false' \
  -F 'profilePhotoPath=@/path/to/photo.jpg'
```

### JSON Representation (Text Fields Only)

```json
{
  "mukkadam_name": "Rajesh Kumar",
  "mobile_numbers": "9876543210",
  "crew_size": "15",
  "max_crew_capacity": "25",
  "alt_phone_1": "9876543211",
  "alt_phone_2": "",
  "start_date": "2026-02-20",
  "end_date": "2026-03-20",
  "latitude": "12.9716",
  "longitude": "77.5946",
  "smartphone_availability": true,
  "is_permanent": false,
  "transport_mode": "bike",
  "whatsapp_notification": true,
  "sms_notification": true,
  "call_notification": false,
  "aadhar_number": "123456789012",
  "pan_number": "ABCDE1234F",
  "voter_id_number": "ABC1234567",
  "state": "Karnataka",
  "state_code": "KA",
  "district": "Bengaluru",
  "district_code": "265",
  "taluka": "Bengaluru North",
  "taluka_code": "2888",
  "village": "Yelahanka",
  "village_code": "234567",
  "pruning": "500",
  "first_dipping": "300",
  "harvesting": "1000"
}
```

---

## Response

### Success Response (200-299)

**Status Code:** 200 OK

```json
{
  "status": "success",
  "message": "Mukkadam registered successfully",
  "data": {
    "mukkadam_id": "MUK123456",
    "mobile_numbers": "9876543210",
    "profile_photo_s3_key": "mukadamapp/profilephoto/9876543210/profile_1770123591306.jpg",
    "location_photo_s3_key": "mukadamapp/locationphoto/9876543210/location_1770123592822.webp"
  }
}
```

### Error Response (400+)

**Status Code:** 400 Bad Request

```json
{
  "status": "error",
  "message": "Validation failed",
  "errors": {
    "mobile_numbers": "Mobile number must be 10 digits",
    "start_date": "Start date is required"
  }
}
```

**Status Code:** 500 Internal Server Error

```json
{
  "status": "error",
  "message": "Internal server error",
  "details": "Database connection failed"
}
```

---

## Flutter Implementation

### Service Class

Location: `lib/services/api_service.dart`

```dart
class ApiService {
  static const String baseUrl = 'https://furtive-chrissy-reparably.ngrok-free.dev';
  static const String apiEndpoint = '/api/mukkadam/';

  Future<Map<String, dynamic>> registerMukkadam(
    MukkadamRegistration registration, {
    File? profilePhoto,
    File? aadharCard,
    File? panCard,
    File? bankProof,
    File? locationPhoto,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$apiEndpoint'),
    );

    // Add headers
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    });

    // Add fields and files
    // ... (see api_service.dart for full implementation)

    final response = await request.send();
    // Handle response
  }
}
```

---

## Testing the API

### Using Postman

1. Create new request
2. Set method to POST
3. Enter URL: `https://furtive-chrissy-reparably.ngrok-free.dev/api/mukkadam/`
4. Go to Body → form-data
5. Add all required fields
6. Add file uploads
7. Send request

### Using the App

1. Run the Flutter app
2. Fill all required fields
3. Add optional data
4. Upload images
5. Click "Register Mukkadam"
6. Check response in logs

---

## Error Handling

### Network Errors

```dart
try {
  await apiService.registerMukkadam(registration);
} on SocketException {
  // No internet connection
} on TimeoutException {
  // Request timeout
} catch (e) {
  // Other errors
}
```

### Validation Errors

The app performs client-side validation before API call:
- Mobile number: 10 digits
- Required fields: Not empty
- Date validation: End date > Start date
- Location: Valid coordinates

---

## Rate Limiting

Check with backend team for:
- Requests per minute
- Maximum payload size
- File size limits

---

## Security

### HTTPS
Always use HTTPS in production.

### Authentication
If API requires authentication, add to headers:
```dart
request.headers.addAll({
  'Authorization': 'Bearer YOUR_TOKEN',
});
```

---

## Support

For API issues:
- Check backend logs
- Verify endpoint is accessible
- Test with Postman first
- Check network connectivity

---

**Last Updated:** February 4, 2026
