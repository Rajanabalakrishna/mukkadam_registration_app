class MukkadamRegistration {
  // Personal Information
  String mukkadamName;
  String mobileNumbers;
  String? aadharNumber;
  String? panNumber;
  String? voterIdNumber;

  // Crew Information
  String crewSize;
  String maxCrewCapacity;
  String? altPhone1;
  String? altPhone2;
  String startDate;
  String endDate;

  // Location
  String latitude;
  String longitude;
  String state;
  String stateCode;
  String district;
  String districtCode;
  String taluka;
  String talukaCode;
  String village;
  String villageCode;

  // Preferences
  bool smartphoneAvailability;
  bool isPermanent;
  String transportMode;
  bool whatsappNotification;
  bool smsNotification;
  bool callNotification;

  // Rate Card
  String? aprilPruning;
  String? bagalBaliFutRemoval;
  String? berryThinning;
  String? bunchSelection;
  String? bunchThinning;
  String? bunchTying;
  String? bunchVariation;
  String? defaultRate;
  String? failFutRemoval;
  String? fingerThinning;
  String? firstDipping;
  String? firstFailFutRemoval;
  String? harvesting;
  String? newPlantation;
  String? otherRate;
  String? paperRemoval;
  String? paperWrapping;
  String? pasting;
  String? pruning;
  String? secondDipping;
  String? secondFailFutRemoval;
  String? shendaTopping;
  String? shootTying;
  String? shootTyingClips;
  String? shootTyingStrings;
  String? thirdDipping;

  // File Paths
  String? profilePhotoPath;
  String? aadharCardPath;
  String? panCardPath;
  String? bankProofPath;
  String? locationCapturePath;

  MukkadamRegistration({
    required this.mukkadamName,
    required this.mobileNumbers,
    this.aadharNumber,
    this.panNumber,
    this.voterIdNumber,
    required this.crewSize,
    required this.maxCrewCapacity,
    this.altPhone1,
    this.altPhone2,
    required this.startDate,
    required this.endDate,
    required this.latitude,
    required this.longitude,
    required this.state,
    required this.stateCode,
    required this.district,
    required this.districtCode,
    required this.taluka,
    required this.talukaCode,
    required this.village,
    required this.villageCode,
    this.smartphoneAvailability = false,
    this.isPermanent = false,
    this.transportMode = 'no_vehicle',
    this.whatsappNotification = true,
    this.smsNotification = true,
    this.callNotification = false,
    this.aprilPruning,
    this.bagalBaliFutRemoval,
    this.berryThinning,
    this.bunchSelection,
    this.bunchThinning,
    this.bunchTying,
    this.bunchVariation,
    this.defaultRate,
    this.failFutRemoval,
    this.fingerThinning,
    this.firstDipping,
    this.firstFailFutRemoval,
    this.harvesting,
    this.newPlantation,
    this.otherRate,
    this.paperRemoval,
    this.paperWrapping,
    this.pasting,
    this.pruning,
    this.secondDipping,
    this.secondFailFutRemoval,
    this.shendaTopping,
    this.shootTying,
    this.shootTyingClips,
    this.shootTyingStrings,
    this.thirdDipping,
    this.profilePhotoPath,
    this.aadharCardPath,
    this.panCardPath,
    this.bankProofPath,
    this.locationCapturePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'mukkadam_name': mukkadamName,
      'mobile_numbers': mobileNumbers,
      'crew_size': crewSize,
      'max_crew_capacity': maxCrewCapacity,
      'alt_phone_1': altPhone1 ?? '',
      'alt_phone_2': altPhone2 ?? '',
      'start_date': startDate,
      'end_date': endDate,
      'latitude': latitude,
      'longitude': longitude,
      'smartphone_availability': smartphoneAvailability,
      'is_permanent': isPermanent,
      'transport_mode': transportMode,
      'whatsapp_notification': whatsappNotification,
      'sms_notification': smsNotification,
      'call_notification': callNotification,
      'aadhar_number': aadharNumber ?? '',
      'pan_number': panNumber ?? '',
      'voter_id_number': voterIdNumber ?? '',
      'state': state,
      'state_code': stateCode,
      'district': district,
      'district_code': districtCode,
      'taluka': taluka,
      'taluka_code': talukaCode,
      'village': village,
      'village_code': villageCode,
      'april_pruning': aprilPruning ?? '',
      'bagal_bali_fut_removal': bagalBaliFutRemoval ?? '',
      'berry_thinning': berryThinning ?? '',
      'bunch_selection': bunchSelection ?? '',
      'bunch_thinning': bunchThinning ?? '',
      'bunch_tying': bunchTying ?? '',
      'bunch_variation': bunchVariation ?? '',
      'default_rate': defaultRate ?? '',
      'fail_fut_removal': failFutRemoval ?? '',
      'finger_thinning': fingerThinning ?? '',
      'first_dipping': firstDipping ?? '',
      'first_fail_fut_removal': firstFailFutRemoval ?? '',
      'harvesting': harvesting ?? '',
      'new_plantation': newPlantation ?? '',
      'other_rate': otherRate ?? '',
      'paper_removal': paperRemoval ?? '',
      'paper_wrapping': paperWrapping ?? '',
      'pasting': pasting ?? '',
      'pruning': pruning ?? '',
      'second_dipping': secondDipping ?? '',
      'second_fail_fut_removal': secondFailFutRemoval ?? '',
      'shenda_topping': shendaTopping ?? '',
      'shoot_tying': shootTying ?? '',
      'shoot_tying_clips': shootTyingClips ?? '',
      'shoot_tying_strings': shootTyingStrings ?? '',
      'third_dipping': thirdDipping ?? '',
      'profilePhotoPath': profilePhotoPath ?? '',
      'aadharCardPath': aadharCardPath ?? '',
      'panCardPath': panCardPath ?? '',
      'bankProofPath': bankProofPath ?? '',
      'locationCapturePath': locationCapturePath ?? '',
    };
  }
}
