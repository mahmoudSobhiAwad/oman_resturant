// import 'dart:developer';

// import 'package:huda_yousef/shared/auth/data/models/sign_up/address_model.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// Future<AddressModel?> getAddressFromLatLng(LatLng latLng) async {
//   try {
//     GeocodingPlatform? geocodingPlatform = GeocodingPlatform.instance;
//     geocodingPlatform?.setLocaleIdentifier('ar');
//     List<Placemark>? placemarks = await geocodingPlatform
//         ?.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

//     if (placemarks != null && placemarks.isNotEmpty) {
//       final place = placemarks.first;
//       return AddressModel(
//         placeName: [
//           place.locality,
//           place.subAdministrativeArea,
//           place.country,
//         ].where((e) => e != null && e.isNotEmpty).join(', '),
//         lat: latLng.latitude,
//         long: latLng.longitude,
//       );
//     }
//   } catch (e) {
//     log("Error in reverse geocoding: $e");
//   }
//   return null;
// }
