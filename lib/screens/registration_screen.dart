import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import '../models/mukkadam_model.dart';
import '../services/api_service.dart';
import '../widgets/form_section.dart';
import '../widgets/image_picker_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState;
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  // Controllers for text fields
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _crewSizeController = TextEditingController();
  final _maxCrewCapacityController = TextEditingController();
  final _altPhone1Controller = TextEditingController();
  final _altPhone2Controller = TextEditingController();
  final _aadharController = TextEditingController();
  final _panController = TextEditingController();
  final _voterIdController = TextEditingController();
  
  // Location controllers
  final _stateController = TextEditingController();
  final _stateCodeController = TextEditingController();
  final _districtController = TextEditingController();
  final _districtCodeController = TextEditingController();
  final _talukaController = TextEditingController();
  final _talukaCodeController = TextEditingController();
  final _villageController = TextEditingController();
  final _villageCodeController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  // Rate card controllers
  final _pruningController = TextEditingController();
  final _aprilPruningController = TextEditingController();
  final _pastingController = TextEditingController();
  final _firstDippingController = TextEditingController();
  final _secondDippingController = TextEditingController();
  final _thirdDippingController = TextEditingController();
  final _harvestingController = TextEditingController();
  final _shootTyingController = TextEditingController();
  final _bunchThinningController = TextEditingController();
  final _fingerThinningController = TextEditingController();
  final _berryThinningController = TextEditingController();
  final _paperWrappingController = TextEditingController();
  final _paperRemovalController = TextEditingController();

  // Date fields
  DateTime? _startDate;
  DateTime? _endDate;

  // Boolean fields
  bool _hasSmartphone = false;
  bool _isPermanent = false;
  bool _whatsappNotification = true;
  bool _smsNotification = true;
  bool _callNotification = false;

  // Transport mode
  String _transportMode = 'no_vehicle';

  // Image files
  File? _profilePhoto;
  File? _aadharCard;
  File? _panCard;
  File? _bankProof;
  File? _locationPhoto;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _crewSizeController.dispose();
    _maxCrewCapacityController.dispose();
    _altPhone1Controller.dispose();
    _altPhone2Controller.dispose();
    _aadharController.dispose();
    _panController.dispose();
    _voterIdController.dispose();
    _stateController.dispose();
    _stateCodeController.dispose();
    _districtController.dispose();
    _districtCodeController.dispose();
    _talukaController.dispose();
    _talukaCodeController.dispose();
    _villageController.dispose();
    _villageCodeController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _pruningController.dispose();
    _aprilPruningController.dispose();
    _pastingController.dispose();
    _firstDippingController.dispose();
    _secondDippingController.dispose();
    _thirdDippingController.dispose();
    _harvestingController.dispose();
    _shootTyingController.dispose();
    _bunchThinningController.dispose();
    _fingerThinningController.dispose();
    _berryThinningController.dispose();
    _paperWrappingController.dispose();
    _paperRemovalController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      setState(() => _isLoading = true);
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied';
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _latitudeController.text = position.latitude.toString();
        _longitudeController.text = position.longitude.toString();
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location captured successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage(ImageSource source, String imageType) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      
      if (image != null) {
        setState(() {
          switch (imageType) {
            case 'profile':
              _profilePhoto = File(image.path);
              break;
            case 'aadhar':
              _aadharCard = File(image.path);
              break;
            case 'pan':
              _panCard = File(image.path);
              break;
            case 'bank':
              _bankProof = File(image.path);
              break;
            case 'location':
              _locationPhoto = File(image.path);
              break;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select start and end dates')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final registration = MukkadamRegistration(
        mukkadamName: _nameController.text,
        mobileNumbers: _mobileController.text,
        crewSize: _crewSizeController.text,
        maxCrewCapacity: _maxCrewCapacityController.text,
        altPhone1: _altPhone1Controller.text.isEmpty ? null : _altPhone1Controller.text,
        altPhone2: _altPhone2Controller.text.isEmpty ? null : _altPhone2Controller.text,
        startDate: DateFormat('yyyy-MM-dd').format(_startDate!),
        endDate: DateFormat('yyyy-MM-dd').format(_endDate!),
        latitude: _latitudeController.text,
        longitude: _longitudeController.text,
        state: _stateController.text,
        stateCode: _stateCodeController.text,
        district: _districtController.text,
        districtCode: _districtCodeController.text,
        taluka: _talukaController.text,
        talukaCode: _talukaCodeController.text,
        village: _villageController.text,
        villageCode: _villageCodeController.text,
        smartphoneAvailability: _hasSmartphone,
        isPermanent: _isPermanent,
        transportMode: _transportMode,
        whatsappNotification: _whatsappNotification,
        smsNotification: _smsNotification,
        callNotification: _callNotification,
        aadharNumber: _aadharController.text.isEmpty ? null : _aadharController.text,
        panNumber: _panController.text.isEmpty ? null : _panController.text,
        voterIdNumber: _voterIdController.text.isEmpty ? null : _voterIdController.text,
        pruning: _pruningController.text.isEmpty ? null : _pruningController.text,
        aprilPruning: _aprilPruningController.text.isEmpty ? null : _aprilPruningController.text,
        pasting: _pastingController.text.isEmpty ? null : _pastingController.text,
        firstDipping: _firstDippingController.text.isEmpty ? null : _firstDippingController.text,
        secondDipping: _secondDippingController.text.isEmpty ? null : _secondDippingController.text,
        thirdDipping: _thirdDippingController.text.isEmpty ? null : _thirdDippingController.text,
        harvesting: _harvestingController.text.isEmpty ? null : _harvestingController.text,
        shootTying: _shootTyingController.text.isEmpty ? null : _shootTyingController.text,
        bunchThinning: _bunchThinningController.text.isEmpty ? null : _bunchThinningController.text,
        fingerThinning: _fingerThinningController.text.isEmpty ? null : _fingerThinningController.text,
        berryThinning: _berryThinningController.text.isEmpty ? null : _berryThinningController.text,
        paperWrapping: _paperWrappingController.text.isEmpty ? null : _paperWrappingController.text,
        paperRemoval: _paperRemovalController.text.isEmpty ? null : _paperRemovalController.text,
      );

      await _apiService.registerMukkadam(
        registration,
        profilePhoto: _profilePhoto,
        aadharCard: _aadharCard,
        panCard: _panCard,
        bankProof: _bankProof,
        locationPhoto: _locationPhoto,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful!'),
            backgroundColor: Colors.green,
          ),
        );
        _resetForm();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _nameController.clear();
      _mobileController.clear();
      _crewSizeController.clear();
      _maxCrewCapacityController.clear();
      _altPhone1Controller.clear();
      _altPhone2Controller.clear();
      _aadharController.clear();
      _panController.clear();
      _voterIdController.clear();
      _stateController.clear();
      _stateCodeController.clear();
      _districtController.clear();
      _districtCodeController.clear();
      _talukaController.clear();
      _talukaCodeController.clear();
      _villageController.clear();
      _villageCodeController.clear();
      _latitudeController.clear();
      _longitudeController.clear();
      _pruningController.clear();
      _aprilPruningController.clear();
      _pastingController.clear();
      _firstDippingController.clear();
      _secondDippingController.clear();
      _thirdDippingController.clear();
      _harvestingController.clear();
      _shootTyingController.clear();
      _bunchThinningController.clear();
      _fingerThinningController.clear();
      _berryThinningController.clear();
      _paperWrappingController.clear();
      _paperRemovalController.clear();
      _startDate = null;
      _endDate = null;
      _hasSmartphone = false;
      _isPermanent = false;
      _whatsappNotification = true;
      _smsNotification = true;
      _callNotification = false;
      _transportMode = 'no_vehicle';
      _profilePhoto = null;
      _aadharCard = null;
      _panCard = null;
      _bankProof = null;
      _locationPhoto = null;
    });
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mukkadam Registration'),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Personal Information Section
                  FormSection(
                    title: 'Personal Information',
                    icon: Icons.person,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Mukkadam Name *',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number *',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mobile number';
                          }
                          if (value.length != 10) {
                            return 'Please enter valid 10-digit mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _aadharController,
                        decoration: const InputDecoration(
                          labelText: 'Aadhar Number',
                          prefixIcon: Icon(Icons.badge),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _panController,
                        decoration: const InputDecoration(
                          labelText: 'PAN Number',
                          prefixIcon: Icon(Icons.credit_card),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _voterIdController,
                        decoration: const InputDecoration(
                          labelText: 'Voter ID Number',
                          prefixIcon: Icon(Icons.how_to_vote),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Crew Information Section
                  FormSection(
                    title: 'Crew Information',
                    icon: Icons.groups,
                    children: [
                      TextFormField(
                        controller: _crewSizeController,
                        decoration: const InputDecoration(
                          labelText: 'Current Crew Size *',
                          prefixIcon: Icon(Icons.group),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter crew size';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _maxCrewCapacityController,
                        decoration: const InputDecoration(
                          labelText: 'Maximum Crew Capacity *',
                          prefixIcon: Icon(Icons.group_add),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter max capacity';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _altPhone1Controller,
                        decoration: const InputDecoration(
                          labelText: 'Alternative Phone 1',
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _altPhone2Controller,
                        decoration: const InputDecoration(
                          labelText: 'Alternative Phone 2',
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          _startDate == null
                              ? 'Select Start Date *'
                              : 'Start Date: ${DateFormat('dd MMM yyyy').format(_startDate!)}',
                        ),
                        leading: const Icon(Icons.calendar_today),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _selectDate(context, true),
                        tileColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          _endDate == null
                              ? 'Select End Date *'
                              : 'End Date: ${DateFormat('dd MMM yyyy').format(_endDate!)}',
                        ),
                        leading: const Icon(Icons.calendar_today),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _selectDate(context, false),
                        tileColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Location Section
                  FormSection(
                    title: 'Location Details',
                    icon: Icons.location_on,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _latitudeController,
                              decoration: const InputDecoration(
                                labelText: 'Latitude *',
                                prefixIcon: Icon(Icons.my_location),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _longitudeController,
                              decoration: const InputDecoration(
                                labelText: 'Longitude *',
                                prefixIcon: Icon(Icons.explore),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _getCurrentLocation,
                        icon: const Icon(Icons.gps_fixed),
                        label: const Text('Get Current Location'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _stateController,
                              decoration: const InputDecoration(
                                labelText: 'State *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _stateCodeController,
                              decoration: const InputDecoration(
                                labelText: 'State Code *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _districtController,
                              decoration: const InputDecoration(
                                labelText: 'District *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _districtCodeController,
                              decoration: const InputDecoration(
                                labelText: 'District Code *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _talukaController,
                              decoration: const InputDecoration(
                                labelText: 'Taluka *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _talukaCodeController,
                              decoration: const InputDecoration(
                                labelText: 'Taluka Code *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _villageController,
                              decoration: const InputDecoration(
                                labelText: 'Village *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _villageCodeController,
                              decoration: const InputDecoration(
                                labelText: 'Village Code *',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Preferences Section
                  FormSection(
                    title: 'Preferences',
                    icon: Icons.settings,
                    children: [
                      SwitchListTile(
                        title: const Text('Has Smartphone'),
                        value: _hasSmartphone,
                        onChanged: (value) {
                          setState(() => _hasSmartphone = value);
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Permanent Position'),
                        value: _isPermanent,
                        onChanged: (value) {
                          setState(() => _isPermanent = value);
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _transportMode,
                        decoration: const InputDecoration(
                          labelText: 'Transport Mode',
                          prefixIcon: Icon(Icons.directions_car),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'no_vehicle', child: Text('No Vehicle')),
                          DropdownMenuItem(value: 'bike', child: Text('Bike')),
                          DropdownMenuItem(value: 'car', child: Text('Car')),
                          DropdownMenuItem(value: 'bus', child: Text('Bus')),
                        ],
                        onChanged: (value) {
                          setState(() => _transportMode = value!);
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Notification Preferences',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text('WhatsApp'),
                        value: _whatsappNotification,
                        onChanged: (value) {
                          setState(() => _whatsappNotification = value!);
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('SMS'),
                        value: _smsNotification,
                        onChanged: (value) {
                          setState(() => _smsNotification = value!);
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Phone Call'),
                        value: _callNotification,
                        onChanged: (value) {
                          setState(() => _callNotification = value!);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Rate Card Section
                  FormSection(
                    title: 'Rate Card (Optional)',
                    icon: Icons.attach_money,
                    children: [
                      TextFormField(
                        controller: _pruningController,
                        decoration: const InputDecoration(
                          labelText: 'Pruning Rate',
                          prefixIcon: Icon(Icons.content_cut),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _aprilPruningController,
                        decoration: const InputDecoration(
                          labelText: 'April Pruning Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _pastingController,
                        decoration: const InputDecoration(
                          labelText: 'Pasting Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _firstDippingController,
                        decoration: const InputDecoration(
                          labelText: 'First Dipping Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _secondDippingController,
                        decoration: const InputDecoration(
                          labelText: 'Second Dipping Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _thirdDippingController,
                        decoration: const InputDecoration(
                          labelText: 'Third Dipping Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _harvestingController,
                        decoration: const InputDecoration(
                          labelText: 'Harvesting Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _shootTyingController,
                        decoration: const InputDecoration(
                          labelText: 'Shoot Tying Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _bunchThinningController,
                        decoration: const InputDecoration(
                          labelText: 'Bunch Thinning Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _fingerThinningController,
                        decoration: const InputDecoration(
                          labelText: 'Finger Thinning Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _berryThinningController,
                        decoration: const InputDecoration(
                          labelText: 'Berry Thinning Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _paperWrappingController,
                        decoration: const InputDecoration(
                          labelText: 'Paper Wrapping Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _paperRemovalController,
                        decoration: const InputDecoration(
                          labelText: 'Paper Removal Rate',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Documents Section
                  FormSection(
                    title: 'Documents',
                    icon: Icons.file_upload,
                    children: [
                      ImagePickerWidget(
                        title: 'Profile Photo',
                        imageFile: _profilePhoto,
                        onPickImage: () => _pickImage(ImageSource.gallery, 'profile'),
                        onCaptureImage: () => _pickImage(ImageSource.camera, 'profile'),
                      ),
                      const SizedBox(height: 16),
                      ImagePickerWidget(
                        title: 'Aadhar Card',
                        imageFile: _aadharCard,
                        onPickImage: () => _pickImage(ImageSource.gallery, 'aadhar'),
                        onCaptureImage: () => _pickImage(ImageSource.camera, 'aadhar'),
                      ),
                      const SizedBox(height: 16),
                      ImagePickerWidget(
                        title: 'PAN Card',
                        imageFile: _panCard,
                        onPickImage: () => _pickImage(ImageSource.gallery, 'pan'),
                        onCaptureImage: () => _pickImage(ImageSource.camera, 'pan'),
                      ),
                      const SizedBox(height: 16),
                      ImagePickerWidget(
                        title: 'Bank Proof',
                        imageFile: _bankProof,
                        onPickImage: () => _pickImage(ImageSource.gallery, 'bank'),
                        onCaptureImage: () => _pickImage(ImageSource.camera, 'bank'),
                      ),
                      const SizedBox(height: 16),
                      ImagePickerWidget(
                        title: 'Location Photo',
                        imageFile: _locationPhoto,
                        onPickImage: () => _pickImage(ImageSource.gallery, 'location'),
                        onCaptureImage: () => _pickImage(ImageSource.camera, 'location'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Submit Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Register Mukkadam',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  OutlinedButton(
                    onPressed: _resetForm,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    child: const Text(
                      'Reset Form',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }
}
