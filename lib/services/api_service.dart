import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/mukkadam_model.dart';

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
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl$apiEndpoint'),
      );

      // Add headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      });

      // Add text fields from the model
      final jsonData = registration.toJson();
      jsonData.forEach((key, value) {
        if (value != null && value.toString().isNotEmpty) {
          request.fields[key] = value.toString();
        }
      });

      // Add image files
      if (profilePhoto != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profilePhotoPath',
            profilePhoto.path,
          ),
        );
      }

      if (aadharCard != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'aadharCardPath',
            aadharCard.path,
          ),
        );
      }

      if (panCard != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'panCardPath',
            panCard.path,
          ),
        );
      }

      if (bankProof != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'bankProofPath',
            bankProof.path,
          ),
        );
      }

      if (locationPhoto != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'locationCapturePath',
            locationPhoto.path,
          ),
        );
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        throw Exception(
          'Failed to register: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }
}
